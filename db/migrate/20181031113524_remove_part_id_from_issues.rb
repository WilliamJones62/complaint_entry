class RemovePartIdFromIssues < ActiveRecord::Migration[5.1]
  def change
    remove_column :issues, :part_id, :integer
  end
end
