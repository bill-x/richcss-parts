class ChangeColumnNamesInParts < ActiveRecord::Migration
  def change
  	remove_column :parts, :github_link
  	add_column :parts, :repo_name, :string
  	add_column :parts, :repo_owner, :string
  end
end
