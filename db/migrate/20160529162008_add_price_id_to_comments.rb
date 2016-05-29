class AddPriceIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :price, index: true, foreign_key: true
  end
end
