class ChangeColumnNamesInVersions < ActiveRecord::Migration
  def change
  	remove_column :versions, :version

  	change_table :versions do |p|
      p.rename :release_number, :release_version
    end
  end
end
