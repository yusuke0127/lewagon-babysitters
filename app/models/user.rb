class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 has_one :babysitter
 has_many :babysitters, through: :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
