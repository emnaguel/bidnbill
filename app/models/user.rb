class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bills
  has_many :bids
  has_many :auctions, through: :bids

  def other_auctions
    Bid.where.not(provider: self).map(&:auction)
  end

  def my_auctions
    self.bids.where(status: "pending", payment_status: "pending").map {|bid| bid.auction}
  end

  def won_auctions
    self.bids.where(status: "completed", payment_status: "pending").map {|bid| bid.auction}
  end

  def my_clients
    self.bids.where(status: "completed", payment_status: "completed").map {|bid| bid.auction}
  end
end
