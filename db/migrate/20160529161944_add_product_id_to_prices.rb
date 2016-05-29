class AddProductIdToPrices < ActiveRecord::Migration
  def change
    add_reference :prices, :product, index: true, foreign_key: true
  end
end
