class AddCountsToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :count, :integer
    add_column :topics, :count24, :integer
  end
end
