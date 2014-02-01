class CreateLastposts < ActiveRecord::Migration
  def change
    create_table :lastposts do |t|
      t.string :title
      t.text :text
      t.time :time
      t.references :user
      t.references :topic
    end
  end
end


