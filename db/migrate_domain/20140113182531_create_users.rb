class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :benutzername
      t.string :passwort
    end
  end
end
