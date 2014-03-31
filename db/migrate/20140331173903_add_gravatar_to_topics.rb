class AddGravatarToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :gravatar_id, :string
  end
end
