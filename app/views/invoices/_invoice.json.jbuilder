json.extract! invoice, :id, :invoice_number, :issue_date, :owner, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
