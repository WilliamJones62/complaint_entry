class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :part_code
      t.float :qty_returned
      t.integer :invoice_id

      t.timestamps
    end
  end
end
