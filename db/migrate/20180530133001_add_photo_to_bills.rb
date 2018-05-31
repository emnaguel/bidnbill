class AddPhotoToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :photo, :string
  end
end
