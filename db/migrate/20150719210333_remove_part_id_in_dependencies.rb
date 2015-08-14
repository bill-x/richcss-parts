class RemovePartIdInDependencies < ActiveRecord::Migration
  def change
  	remove_column :dependencies, :part_id
  end
end
