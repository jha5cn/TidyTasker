class AddColumnsTask < ActiveRecord::Migration
  def change
	add_column :tasks, :title, :string
	add_column :tasks, :timePoints, :integer
	add_column :tasks, :description, :string
	add_column :tasks, :inProgress, :boolean
	add_column :tasks, :completed, :boolean
	add_column :tasks, :removed, :boolean
	
  end
end
