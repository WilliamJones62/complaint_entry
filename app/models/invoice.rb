class Invoice < ApplicationRecord
  has_many :parts, inverse_of: :invoice, :dependent => :destroy
  accepts_nested_attributes_for :parts, reject_if: proc { |attributes| attributes['part_code'].blank? }
  has_many :issues, inverse_of: :invoice, :dependent => :destroy
  accepts_nested_attributes_for :issues, reject_if: proc { |attributes| attributes['category'].blank? }
  validates_presence_of :invoice_number
  validates_presence_of :issue_date
end
