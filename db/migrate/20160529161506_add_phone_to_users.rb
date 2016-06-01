class AddPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :integer
    #change_column :users, :phone, :string
  end
end
