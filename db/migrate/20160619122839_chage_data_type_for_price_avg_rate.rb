class ChageDataTypeForPriceAvgRate < ActiveRecord::Migration
  def change
  	change_column :prices,:avg_rating,:decimal, :precision => 16, :scale => 2
  end
end
