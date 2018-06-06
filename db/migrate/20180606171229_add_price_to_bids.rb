class AddPriceToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :price, :integer
  end
end
