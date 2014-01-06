class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|


      t.string :Vorname



      t.string :Name



      t.string :EMail



      t.string :Benutzername



      t.string :Passwort



    end

  end
end
