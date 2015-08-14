class AddReleaseNumberToVersions < ActiveRecord::Migration
  def change
  	add_column :versions, :release_number, :string
  end
end
