class AddPartIdToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :part_id, :integer
  end
end
