class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages do |t|
      t.text :message
      t.references :user
    end
  end
end
