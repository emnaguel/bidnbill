class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:dashboard]
  before_action :ensure_user_is_provider

  def dashboard
    @other_auctions = current_user.other_auctions

    if params[:query].present? && params[:where].present?
       @other_auctions = @other_auctions.search("#{params[:query]} #{params[:where]}")
    elsif params[:query].present?
       @other_auctions = @other_auctions.search(params[:query])
    elsif params[:where].present?
      @other_auctions = @other_auctions.search(params[:where])
    end

    @my_auctions = current_user.my_auctions
    @won_auctions = current_user.won_auctions
    @my_clients = current_user.my_clients

    @pending_order = current_user.orders.where(state: "pending").first


    @markers_other_auctions = @other_auctions.reject { |auction| auction.bill.latitude.nil? || auction.bill.longitude.nil? }.map do |auction|
      {
        lat: auction.bill.latitude,
        lng: auction.bill.longitude,
      }

    end

    @markers_my_auctions = @my_auctions.reject { |auction| auction.bill.latitude.nil? || auction.bill.longitude.nil? }.map do |auction|
      {
        lat: auction.bill.latitude,
        lng: auction.bill.longitude,
      }
    end

    @markers_my_clients = @my_clients.reject { |auction| auction.bill.latitude.nil? || auction.bill.longitude.nil? }.map do |auction|
      {
        lat: auction.bill.latitude,
        lng: auction.bill.longitude,
      }
    end
  end

  private

  def ensure_user_is_provider
    redirect_to dashboard_path unless current_user.user_type == "provider"
  end
end
