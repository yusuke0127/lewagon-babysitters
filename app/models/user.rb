class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one :babysitter
  has_many :babysitters, through: :reservations
  has_many :reservations
  has_many :reservations_as_babysitter, through: :babysitter, source: :reservations
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
