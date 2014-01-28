class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :vorname
      t.string :name
      t.string :email
      t.string :benutzername
    end
  end
end
