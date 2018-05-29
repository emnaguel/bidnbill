class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

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

  private
    def set_bid
      @bid = Bid.find(params[:id])
    end

    def bid_params
      params.require(:bid).permit(:auction_id, :user_id, :status, :content)
    end
end
