class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.string :current_provider
      t.string :address
      t.string :price

      t.timestamps
    end
  end
end
