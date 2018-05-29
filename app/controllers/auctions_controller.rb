class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  def show
  end

  def create
    @auction = Auction.new(bill: Bill.find(params[:bill_id]))
    @auction.save
    redirect_to bills_path
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
