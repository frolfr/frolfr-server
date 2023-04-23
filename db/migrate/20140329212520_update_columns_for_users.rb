class UpdateColumnsForUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
    rename_column :users, :name, :first_name
  end
end
