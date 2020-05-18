class Babysitter < ApplicationRecord
  belongs_to :user

  validates :age, presence: true, numericality: true
  validates :price_per_hour, presence: true, numericality:true
end
