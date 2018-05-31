class AddCoordinatesToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :latitude, :float
    add_column :bills, :longitude, :float
  end
end
