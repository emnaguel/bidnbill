class Auction < ApplicationRecord
  after_create :send_creation_email

  include PgSearch

  pg_search_scope :search,
    against: [],
    associated_against: {
      bill: [ :address ],
      client: [ :email ],
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  belongs_to :bill
  has_one :category, through: :bill
  has_one :client, through: :bill
  has_many :providers, through: :bids
  has_many :bids, dependent: :destroy
  validates :bill_id, uniqueness: true

  private

  def send_creation_email
    AuctionMailer.new_auction(self.client).deliver_now
  end
end
