class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
end
