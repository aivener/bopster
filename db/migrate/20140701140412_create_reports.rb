class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.integer :amount
    	t.integer :kid_id
    	t.integer :goal_id
    	t.integer :status
    	t.timestamps
    end
  end
end
