class Auction < ApplicationRecord
  belongs_to :bill
  has_one :client, through: :bill
  has_many :bids
end
