class CreateLastposts < ActiveRecord::Migration
  def change
    create_table :lastposts do |t|


      t.string :title



      t.text :text



      t.time :time



      t.references :user_id, index: true



      t.references :topic, index: true



    end

  end
end
