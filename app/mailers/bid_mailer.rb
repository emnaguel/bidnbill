class BidMailer < ApplicationMailer
  def new_bid(bid)
    @bid = bid
    @auction = @bid.auction
    @client = @auction.client
    mail(to: @client.email, subject: 'You have received a new bid')
  end
end
