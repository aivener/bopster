class RemoveParentIdFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :parent_id, :integer
  end
end
