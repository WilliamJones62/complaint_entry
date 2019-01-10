class Part < ApplicationRecord
  belongs_to :invoice, :foreign_key => "invoice_id"
  has_many :part_issues
  has_many :issues, through: :part_issues
end
