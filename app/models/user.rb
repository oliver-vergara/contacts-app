class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  has_many :contacts
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
