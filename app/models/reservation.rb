class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :babysitter

  validates :start_time, presence: true
  validates :end_time, presence: true
#   validates :babysitter, uniqueness: { scope: :user }
#   validates :babysitter, uniqueness: { scope: :start_time }
#   validates :babysitter, uniqueness: { scope: :end_time }
  STATUS = ['pending', 'confirmed', 'cancelled']

  def pending?
    status == 'pending'
  end
end
