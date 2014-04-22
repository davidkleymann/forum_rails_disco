class CreateLastPosts < ActiveRecord::Migration
  def change
    create_table :last_posts do |t|
      t.string :title
      t.text :text
      t.references :user
      t.references :topic
			t.timestamps
    end
  end
end


