class User < ActiveRecord::Base
  require 'rubygems' # not necessary with ruby 1.9 but included for completeness
  require 'twilio-ruby'
  extend FriendlyId
  has_many :identities
  has_many :training_programs, foreign_key: :user_id
  attr_accessor :login
  attr_accessor :roles
  has_many :parameters
  has_many :events
  before_create :set_default_role

  ROLES = %i[admin moderator trainer user banned]
  enum male_type: %w(Чоловік Жінка)
  friendly_id :username, use: :slugged
  validates :username,
            :uniqueness => {
                :case_sensitive => false
            },
            :format => {
                with: /^[a-zA-Z0-9_\.]*$/,
                :multiline => true
            }
  has_attached_file :avatar,
                    :path => ':rails_root/public/system/:attachment/:id/:basename_:style.:extension',
                    :url => '/system/:attachment/:id/:basename_:style.:extension',
                    :default_url => '/images/no-image.jpg'
  validates_attachment :avatar,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable :validatable,
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable,  :omniauthable, :authentication_keys => [:login]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def has_program?(program)
    TrainingProgram.where(user: self).where('id= (?) OR template_id= (?)', program.id, program.id).empty? ? false : true
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def facebook
    identities.where(:provider => 'facebook' ).first
  end

  def training_days
    programs = self.training_programs
    days = []
    programs.each do |p|
      p.training_days.each do |t|
        if t.training_day_exercises.count > 0
          days << ["#{p.name} - #{t.description}", t.id]
        end
      end
    end
    days
  end

  def self.remind
    events = Event.includes(:user, :training_day).all
    day = Date.today.wday
    events.each do |event|
      if day == event.day
        if event.sent?
          if Time.now - event.correct_time > 0
            event.sent = false
            event.save!
          end
        else
          time = event.correct_time - Time.now
          if (time < 3600.0 && time > 0 )
            event.sent = true
            event.save!
            EventMailer.send_remind_email(event).deliver_now if event.email?
            if event.sms?
              program = event.training_day.training_programs(event.user).first
              message = "#{event.name} через #{time.to_i.abs / 60} хв. #{program.name}:#{event.training_day.description}"
              send_sms(message)
            end
          end
        end
      end
    end
  end
  def self.send_sms(body)
    @twilio_number =  '12056778948'#ENV['TWILIO_PHONE_NUMBER']
    @client = Twilio::REST::Client.new('ACac3fabd505eeb25b13eb5f59a0e831f9', '744eca4b5153374761dd383fef47bfeb')#ENV['TWILIO_ID'], ENV['TWILIO_AUTH_TOKEN'])
    message = @client.account.sms.messages.create(
        from: "+#{@twilio_number}",
        to: '+380934943954',
        body: body
    )
    puts message
  end
  private
  def set_default_role
    self.roles=['user']
  end
end
