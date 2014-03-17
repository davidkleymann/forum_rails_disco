class CreateThemas < ActiveRecord::Migration
  def change
    create_table :themas do |t|


      t.string :title



      t.text :description


      t.timestamp :lastpost_time
      
      t.string :lastpost_user
      

      t.integer :belong

    end

  end
end
