class AddPriceIdToRates < ActiveRecord::Migration
  def change
    add_reference :rates, :price, index: true, foreign_key: true
  end
end
