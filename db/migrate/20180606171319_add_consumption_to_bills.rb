class AddConsumptionToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :consumption, :integer
  end
end
