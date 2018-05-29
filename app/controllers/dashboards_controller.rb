class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:dashboard]
  after_action :verify_policy_scoped, only: :dashboard

  def dashboard
    @auctions = policy_scope(Auction).order(created_at: :desc)
    @other_auctions = current_user.other_auctions
    @my_auctions = current_user.my_auctions
    @won_auctions = current_user.won_auctions
    @my_clients = current_user.my_clients
  end
end
