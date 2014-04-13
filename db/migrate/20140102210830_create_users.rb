class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :vorname
      t.string :name
      t.string :email
      t.string :benutzername
      t.integer :typ #0=normal, 1=moderator, 2=Administrator ergaenzungen erwuenscht
    end
  end
end
