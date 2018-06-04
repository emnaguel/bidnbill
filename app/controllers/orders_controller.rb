class OrdersController < ApplicationController
  skip_after_action :verify_authorized

  before_action :find_or_create_order, only: [:create]

  def create
    @bid = current_user.bids.find(params[:bid_id])

    add_bid_to_order(@bid)

    redirect_to provider_dashboard_path(anchor: "third-a")
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  private

  def add_bid_to_order(bid)
    bid.update(order: @order)

    # calculate total amount
    amount_cents = 0

    @order.bids.each do |bid|
      amount_cents += bid.bill.category.price_cents
    end

    @order.update(amount_cents: amount_cents)
  end

  def find_or_create_order
    @order = current_user.orders.where(state: "pending").first_or_create!
  end
end
