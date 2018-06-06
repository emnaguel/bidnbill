class SelectionMailer < ApplicationMailer
  def invitation_to_pay(bid)
    @bid = bid
    @auction = @bid.auction
    @client = @auction.client
    @provider = @bid.provider
    mail(to: @provider.email, subject: 'Congrats, your bid has been selected!')
  end
end
