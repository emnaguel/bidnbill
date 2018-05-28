class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @bids = Bid.all
  end

  def show
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
      if @bid.save
        redirect_to @bid
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
