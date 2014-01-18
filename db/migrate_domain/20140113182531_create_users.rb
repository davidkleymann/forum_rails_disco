class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|


      t.string :Vorname



      t.string :Name



      t.string :Email



      t.string :Benutzername



      t.string :Passwort
    end
  end
end
