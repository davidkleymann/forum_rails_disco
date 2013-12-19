class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :startedby
      t.string :replies

      t.timestamps
    end
  end
end
