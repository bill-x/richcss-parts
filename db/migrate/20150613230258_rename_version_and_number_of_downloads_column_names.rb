class RenameVersionAndNumberOfDownloadsColumnNames < ActiveRecord::Migration
  def change
    change_table :parts do |p|
      p.rename :version, :current_version
      p.rename :number_of_downloads, :total_downloads
    end
  end
end
