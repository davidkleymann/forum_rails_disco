class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|


      t.string :name



      t.integer :user_id



      t.integer :type



    end

  end
end
