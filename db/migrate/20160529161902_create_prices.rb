class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.text :image
      t.float :price
      t.text :address
      t.float :longitude
      t.float :latitude
      t.float :avg_rating

      t.timestamps null: false
    end
  end
end
