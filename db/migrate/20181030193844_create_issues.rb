class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :category
      t.string :issue
      t.integer :invoice_id

      t.timestamps
    end
  end
end
