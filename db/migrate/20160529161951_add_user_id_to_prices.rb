class AddUserIdToPrices < ActiveRecord::Migration
  def change
    add_reference :prices, :user, index: true, foreign_key: true
  end
end
