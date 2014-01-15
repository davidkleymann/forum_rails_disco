class RenameUsersEmail < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.rename :EMail, :Email
    end
  end
end
