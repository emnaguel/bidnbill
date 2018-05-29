class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy, :select, :pay]

  def index
    @bids = Bid.all
  end

  def show
  end

  def new
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.auction = Auction.find(params[:auction_id])
    @bid.provider = current_user
    @bid.status = 'pending'
    if @bid.save
      redirect_to auction_path(@bid.auction)
    else
      render :new
    end
  end

  def select
    can_select = true
    @bid.auction.bids.each do |bid|
      if bid.status == 'completed'
        can_select = false
      end
    end
    if can_select == true
      @bid.status = 'completed'
      @bid.save
    end
    redirect_to auction_path(@bid.auction)
  end

  def pay
    can_pay = true
    @bid.auction.bids.each do |bid|
      if bid.payment_status == 'completed'
        can_pay = false
      end
    end
    if can_pay == true
      @bid.payment_status = 'completed'
      @bid.save
    end
    redirect_to provider_dashboard_path
  end

  private
    def set_bid
      @bid = Bid.find(params[:id])
    end

    def bid_params
      params.require(:bid).permit(:auction_id, :user_id, :status, :content)
    end
end
