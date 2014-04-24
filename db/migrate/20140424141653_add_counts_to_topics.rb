class AddCountsToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :count, :integer, default: 0
    add_column :topics, :count24, :integer, default: 0
  end
end
