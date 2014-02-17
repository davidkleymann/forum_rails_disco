class AddTableLatesttopics < ActiveRecord::Migration
  def change
  	   create_table :latesttopics do |t|
      t.string :title
      t.references :user
      t.references :thema
      t.timestamps
    end
  end
end
