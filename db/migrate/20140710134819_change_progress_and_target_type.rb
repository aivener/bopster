class ChangeProgressAndTargetType < ActiveRecord::Migration
  def change
  	change_column :goals, :progress, :float
  	change_column :goals, :target, :float
  end
end
