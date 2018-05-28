class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
