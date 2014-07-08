class AddPrizeStatusToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :prize_status, :integer
  end
end
