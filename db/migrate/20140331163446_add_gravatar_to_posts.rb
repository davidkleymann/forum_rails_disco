class AddGravatarToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :gravatar_id, :string
  end
end
