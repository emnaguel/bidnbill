class AddCategoryToBills < ActiveRecord::Migration[5.2]
  def change
    add_reference :bills, :category, foreign_key: true
  end
end
