class SecurePassword < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :passwort, :string
  end
end
