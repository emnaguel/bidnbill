class DashboardsController < ApplicationController
  def all_auctions
    @auctions = Auction.all
  end

  def my_auctions
    @auctions = Auction.where(provider: current_user)
  end

  def won_auctions
    @auctions = my_auctions
    @won_auctions = []
    @auctions.each do |auction|
      auction.bids.each do |bid|
        if bid.status == 'completed' && bid.provider == current_user
          @won_auctions << auction
        end
      end
    end
    @won_auctions
  end

  def my_clients
    @auctions = won_auctions
    @my_clients = []
    @auctions.each do |auction|
      auction.bids.each do |bid|
        if bid.status == 'completed' && bid.provider == current_user && bid.payment_status == 'completed'
          @my_clients << auction
        end
      end
    end
    @my_clients
  end


end
