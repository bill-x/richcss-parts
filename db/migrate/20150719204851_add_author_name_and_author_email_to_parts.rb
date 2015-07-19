class AddAuthorNameAndAuthorEmailToParts < ActiveRecord::Migration
  def change
  	add_column :parts, :author_name, :string
  	add_column :parts, :author_email, :string
  end
end
