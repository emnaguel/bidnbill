class AddCityAndZipToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :city, :string
    add_column :bills, :zip_code, :string
  end
end
