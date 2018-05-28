class Auction < ApplicationRecord
  belongs_to :bill
  has_one :client, through: :bill
  has_many :bids, dependent: :destroy
  validates :bill_id, uniqueness: true
end
