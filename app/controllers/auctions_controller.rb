class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  def show
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to @auction
    else
      render :new
    end
  end

  def destroy
    @auction.destroy
    redirect_to auctions_url
  end

  private
    def set_auction
      @auction = Auction.find(params[:id])
    end

    def auction_params
      params.require(:auction).permit(:bill_id)
    end
end
