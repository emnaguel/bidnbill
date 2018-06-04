class AddOrderIdToBids < ActiveRecord::Migration[5.2]
  def change
    add_reference :bids, :order
  end
end
