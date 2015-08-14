class AddVersions < ActiveRecord::Migration
  def change
  	create_table :versions do |t|
    	t.string :part_id
    	t.string :version
    	t.integer :number_of_downloads
    	
    	t.timestamps
    end
  end
end
