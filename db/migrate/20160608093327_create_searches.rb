class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :address

      t.timestamps null: false
    end
  end
end
