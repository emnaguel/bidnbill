class User < ApplicationRecord
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bills
  has_many :bids
  has_many :auctions, through: :bids
  has_many :provider_categories
  has_many :categories, through: :provider_categories
  has_many :orders
  has_many :conversations, inverse_of: :provider

  USERTYPE = ['client', 'provider']
  CLIENTTYPE = ['particulier', 'professionnel']

  mount_uploader :photo, PhotoUploader

  def my_auctions
    auction_ids = (auctions - Auction.joins(:bids).where(bids: {status: "completed"})).uniq.map(&:id)
    Auction.where(id: auction_ids)
  end

  def won_auctions
    auction_ids = bids.where(status: "completed", payment_status: "pending").map { |bid| bid.auction.id }
    Auction.where(id: auction_ids)
  end

  def my_clients
    auction_ids = bids.where(status: "completed", payment_status: "completed").map { |bid| bid.auction.id }
    Auction.where(id: auction_ids)
  end

  def other_auctions
    # Auction.left_outer_joins(:bids).where("bids.status IS NULL OR bids.status != 'completed'") - auctions

    Auction.left_outer_joins(:bids).
      where("bids.status IS NULL OR bids.status != 'completed'").
      where.not(id: auctions.pluck(:id))
  end

  # def conversations_as_client
  #   Conversation.joins(auction: { bill: :client }).where(auctions: { bills: { client: self}})
  # end

  private

  def send_welcome_email
    # UserMailer.welcome(self).deliver_now
  end
end
