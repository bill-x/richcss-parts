class SetDownloadsDefaultValueInVersions < ActiveRecord::Migration
  def change
  	change_column :versions, :number_of_downloads, :integer, :default => 0
  end
end
