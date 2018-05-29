class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bills
  has_many :bids
  has_many :auctions, through: :bids

  def my_auctions
    auctions - Auction.joins(:bids).where(bids: {status: "completed"})
    #bids.where(status: "pending").map {|bid| bid.auction}
  end

  def won_auctions
    self.bids.where(status: "completed", payment_status: "pending").map {|bid| bid.auction}
  end

  def my_clients
    self.bids.where(status: "completed", payment_status: "completed").map {|bid| bid.auction}
  end

  def other_auctions
    Auction.joins(:bids).where.not(bids: { status: "completed"}) - auctions
  end
end
