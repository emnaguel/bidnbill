class Auction < ApplicationRecord
  belongs_to :bill
  has_one :category, through: :bill
  has_one :client, through: :bill
  has_many :providers, through: :bids
  has_many :bids, dependent: :destroy
  validates :bill_id, uniqueness: true
end
