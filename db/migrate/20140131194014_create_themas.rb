class CreateThemas < ActiveRecord::Migration
  def change
    create_table :themas do |t|


      t.string :title



      t.text :description


      t.integer :lastact

      t.integer :belong

    end

  end
end
