class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:dashboard]
  before_action :ensure_user_is_provider

  def dashboard
    @other_auctions = current_user.other_auctions
    @my_auctions = current_user.my_auctions
    @won_auctions = current_user.won_auctions
    @my_clients = current_user.my_clients
  end

  private

  def ensure_user_is_provider
    redirect_to dashboard_path unless current_user.user_type == "provider"
  end
end
