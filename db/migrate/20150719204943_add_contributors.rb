class AddContributors < ActiveRecord::Migration
  def change
  	create_table :contributors do |t|
    	t.string :part_id
    	t.string :name
    	
    	t.timestamps
    end
  end
end
