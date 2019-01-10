class RemoveInvoiceIdFromIssues < ActiveRecord::Migration[5.1]
  def change
    remove_column :issues, :invoice_id, :integer
  end
end
