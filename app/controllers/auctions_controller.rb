class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]


  def index
    @auctions = policy_scope(Auction).order(created_at: :desc)

  end

  def show
    authorize @auction
    @bids = policy_scope(@auction.bids)
  end

  def create
    @auction = Auction.new(bill: Bill.find(params[:bill_id]))
    authorize @auction
    @auction.save
    redirect_to dashboard_path
  end

  def destroy
    authorize @auction
    @auction.destroy
    redirect_to dashboard_path
  end

  private

  def set_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.require(:auction).permit(:bill_id)
  end
end
