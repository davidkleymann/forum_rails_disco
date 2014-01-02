class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|


      t.string :title



      t.text :text



      t.time :time



      t.string :user




    end

  end
end
