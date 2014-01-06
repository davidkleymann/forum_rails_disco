class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|


      t.string :title



      t.text :text



      t.time :time



      t.references :user_id

      

      t.references :topic
    


    end

  end
end
