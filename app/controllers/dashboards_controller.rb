class DashboardsController < ApplicationController
  def all_auctions
    @auctions = Auction.all
  end

  def my_auctions
    @auctions = Auction.where(provider: current_user)
  end

  def won_auctions
    @auctions = Auction.where(provider: current_user && bill.status = 'completed')
  end

  def my_clients
    @auctions = Auction.where(provider: current_user && bill.status = 'completed')
  end


end
