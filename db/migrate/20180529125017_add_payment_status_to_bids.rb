class AddPaymentStatusToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :payment_status, :string
  end
end
