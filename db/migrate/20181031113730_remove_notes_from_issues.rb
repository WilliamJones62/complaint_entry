class RemoveNotesFromIssues < ActiveRecord::Migration[5.1]
  def change
    remove_column :issues, :notes, :text
  end
end
