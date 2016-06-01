class ChanageIntegerFormatInUsers < ActiveRecord::Migration
  # def change
  # 	change_column :users, :phone, :string
  # end

  def up
  	change_column :users, :phone, :string
  end
  def down
  	change_column :users, :phone, :integer
  end
end
