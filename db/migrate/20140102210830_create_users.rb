class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :vorname
      t.string :name
      t.string :email
      t.string :benutzername
      t.integer :type #0=normal, 1=admin, ergaenzungen erwuenscht
    end
  end
end
