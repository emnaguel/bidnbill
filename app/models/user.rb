class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bills
  has_many :bids
  has_many :auctions, through: :bids

  def won_auctions
    self.bids.where(status: "completed").map {|bid| bid.auction}
  end
end
