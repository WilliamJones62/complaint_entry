class AddInvoiceIdToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :invoice_id, :integer
  end
end
