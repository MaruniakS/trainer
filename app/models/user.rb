class User < ActiveRecord::Base
  has_many :identities
  attr_accessor :login
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
end
