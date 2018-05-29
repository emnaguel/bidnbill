class Auction < ApplicationRecord
  belongs_to :bill
  has_one :client, through: :bill
<<<<<<< HEAD
  has_many :bids
  has_many :providers, through: :bids
=======
  has_many :bids, dependent: :destroy
  validates :bill_id, uniqueness: true
>>>>>>> 399598986a3195ffaeee77968fe789448267c034
end
