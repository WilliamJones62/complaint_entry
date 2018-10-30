class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.date :issue_date
      t.string :owner

      t.timestamps
    end
  end
end
