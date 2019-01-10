class RemovePicturesFromIssues < ActiveRecord::Migration[5.1]
  def change
    remove_column :issues, :pictures, :string
  end
end
