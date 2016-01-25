class User < ActiveRecord::Base
  has_many :identities
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable :validatable,
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable,  :omniauthable

  def facebook
    identities.where(:provider => 'facebook' ).first
  end
end
