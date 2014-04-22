class CreateLatestTopics < ActiveRecord::Migration
  def change
    create_table :latest_topics do |t|
      t.string :title
      t.references :user
      t.references :thema
      t.timestamps
    end
  end
end
