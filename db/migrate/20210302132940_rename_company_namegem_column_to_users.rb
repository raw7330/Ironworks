class RenameCompanyNamegemColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :company_namegem, :company_name
  end
end
