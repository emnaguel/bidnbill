class AuctionMailer < ApplicationMailer
  def new_auction(user)
    @user = user
    mail(to: @user.email, subject: "#{@user.first_name}, your auction has been succesfully created")
  end
end
