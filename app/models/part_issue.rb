class PartIssue < ActiveRecord::Base
  belongs_to :part
  belongs_to :issue
  mount_uploader :pictures, ImageUploader
end
