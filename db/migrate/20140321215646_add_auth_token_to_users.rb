class AddAuthTokenToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :auth_token, :string
  end
end
