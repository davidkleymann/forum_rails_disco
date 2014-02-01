class CreateAdminmessages < ActiveRecord::Migration
  def change
    create_table :adminmessages do |t|


      t.text :message



      t.references :user



    end

  end
end
