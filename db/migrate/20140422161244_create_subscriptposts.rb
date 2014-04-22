class CreateSubscriptposts < ActiveRecord::Migration
  def change
    create_table :subscriptposts do |t|
      t.string :title
      t.text :text
      t.string :benutzername
      t.string :gravatar_id
      t.timestamps
    end
  end
end
