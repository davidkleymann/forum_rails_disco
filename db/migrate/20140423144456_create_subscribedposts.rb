class CreateSubscribedposts < ActiveRecord::Migration
  def change
    create_table :subscribedposts do |t|
      t.string :title
      t.text :text
      t.string :benutzername
      t.string :gravatar_id
      t.references :subscription, index: true
      t.boolean :updated
      t.timestamps
    end
  end
end
