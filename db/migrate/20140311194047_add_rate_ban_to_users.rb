class AddRateBanToUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.boolean :ban
  		t.integer :rate
  	end
  end
  def down
  	change_table :users do |t|
  		t.remove :ban, :rate
  	end
  end
end
