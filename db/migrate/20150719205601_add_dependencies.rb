class AddDependencies < ActiveRecord::Migration
  def change
  	create_table :dependencies do |t|
    	t.string :part_id
    	t.string :part_name
    	t.string :part_version
    	t.string :dependency_name
    	t.string :dependency_version
    	
    	t.timestamps
    end
  end
end
