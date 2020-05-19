class Babysitter < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :age, presence: true, numericality: true
  validates :price_per_hour, presence: true, numericality:true
end
