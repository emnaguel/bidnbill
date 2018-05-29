class DashboardsController < ApplicationController

  def all_auctions
    @my_auctions = current_user.auctions
    @auctions = Auction.all
    @auction_filter = @auctions - @my_auctions
  end


end
