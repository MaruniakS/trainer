class User < ActiveRecord::Base
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
          end
        else
          time = event.correct_time - Time.now
          if (time < 3600.0 && time > 0 )
            event.sent = true
            EventMailer.send_remind_email(event).deliver_now if event.email?
            send_sms if event.sms?
          end
        end
      end
      event.save
    end
  end
  def send_sms
    @twilio_number =  ENV['TWILIO_PHONE_NUMBER']
    @client = Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_AUTH_TOKEN'])
    reminder = "Test"
    message = @client.account.sms.messages.create(
        from: @twilio_number,
        to: '+380988022880',
        body: reminder
    )
    puts message
  end
  private
  def set_default_role
    self.roles=['user']
  end
end
