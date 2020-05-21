class Babysitter < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :age, presence: true, numericality: true
  validates :price_per_hour, presence: true, numericality:true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: :price_per_hour,
    associated_against: {
      user: [ :first_name, :last_name, :address ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
