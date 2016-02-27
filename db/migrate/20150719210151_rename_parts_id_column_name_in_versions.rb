class RenamePartsIdColumnNameInVersions < ActiveRecord::Migration
  def change
  	change_table :versions do |p|
      p.rename :part_id, :part_name
    end
  end
end
