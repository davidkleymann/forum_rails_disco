class CreateLastposts < ActiveRecord::Migration
  def change
    create_table :lastposts do |t|
      t.string :title
      t.text :text
      t.references :user
      t.references :topic
			t.timestamps
    end
  end
end


