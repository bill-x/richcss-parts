class ChangeColumnNamesInParts2 < ActiveRecord::Migration
  def change
  	remove_column :parts, :repo_name
  	remove_column :parts, :repo_owner
  	add_column :parts, :homepage, :string

  	change_table :parts do |p|
      p.rename :current_version, :version
      p.rename :author_name, :authors
      p.rename :author_email, :email
    end
  end
end
