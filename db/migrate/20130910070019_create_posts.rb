class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.timestamps
      t.string :benutzername
      t.references :user
      t.references :topic
    end
  end
end
