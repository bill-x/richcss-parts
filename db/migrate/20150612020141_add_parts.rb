class AddParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
    	t.string :name
    	t.string :version
    	t.string :description
    	t.integer :number_of_downloads
    	
    	t.timestamps
    end
  end
end
