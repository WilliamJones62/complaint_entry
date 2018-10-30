class CreatePartIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :part_issues do |t|
      t.string :pictures
      t.text :notes
      t.integer :part_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
