class AddGithubLinkToParts < ActiveRecord::Migration
  def change
  	add_column :parts, :github_link, :string
  end
end
