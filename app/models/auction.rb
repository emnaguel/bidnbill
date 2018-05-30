class Auction < ApplicationRecord
  include PgSearch

  pg_search_scope :search,
    against: [],
    associated_against: {
      bill: [ :address, :category ],
      client: [ :email ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  belongs_to :bill
  has_one :client, through: :bill
  has_many :providers, through: :bids
  has_many :bids, dependent: :destroy
  validates :bill_id, uniqueness: true
end
