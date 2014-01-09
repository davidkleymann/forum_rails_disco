class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :thema
      t.integer :startedby

      t.timestamps
    end
  end
end
