class ChangeReleaseVersionToVersionInVersions < ActiveRecord::Migration
  def change
  	change_table :versions do |p|
      p.rename :release_version, :version
    end
  end
end
