class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.boolean :email
      t.integer :topic_id
      t.string :topic_name
    end
  end
end
