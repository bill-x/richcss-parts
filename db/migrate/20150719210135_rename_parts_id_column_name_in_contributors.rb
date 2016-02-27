class RenamePartsIdColumnNameInContributors < ActiveRecord::Migration
  def change
  	change_table :contributors do |p|
      p.rename :part_id, :part_name
    end
  end
end
