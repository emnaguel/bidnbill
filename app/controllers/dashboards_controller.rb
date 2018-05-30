class DashboardsController < ApplicationController
  skip_after_action :verify_authorized


  def dashboard
    @auctions = Auction.all.order(created_at: :desc)
    @other_auctions = current_user.other_auctions
    @my_auctions = current_user.my_auctions
    @won_auctions = current_user.won_auctions
    @my_clients = current_user.my_clients
  end


end
