class ChangeDataTypeForPrice < ActiveRecord::Migration
  def change
  	change_column :prices,:price,:decimal, :precision => 16, :scale => 2
  end
end
