class ChangeAmountToFloat < ActiveRecord::Migration
  def change
  	change_column :reports, :amount, :float
  end
end
