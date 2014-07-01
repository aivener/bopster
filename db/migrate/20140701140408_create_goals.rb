class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
    	t.string :title
    	t.string :description
    	t.integer :kid_id
    	t.integer :parent_id
    	t.integer :target
    	t.string :unit
    	t.integer :progress
    	t.string :prize
    	t.integer :status 
    	t.timestamps
    end
  end
end
