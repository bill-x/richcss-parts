class SetDownloadsDefaultValueInParts < ActiveRecord::Migration
  def change
  	change_column :parts, :total_downloads, :integer, :default => 0
  end
end
