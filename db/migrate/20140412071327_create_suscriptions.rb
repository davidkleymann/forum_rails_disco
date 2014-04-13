class CreateSuscriptions < ActiveRecord::Migration
  def change
    create_table :suscriptions do |t|
      t.references :user, index: true
      t.boolean :email
    end
  end
end
