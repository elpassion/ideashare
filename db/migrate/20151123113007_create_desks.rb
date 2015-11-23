class CreateDesks < ActiveRecord::Migration
  def change
    create_table :desks do |t|
      t.integer :owner_id, null: false, index: true
      
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :finish_at

      t.timestamps null: false
    end
    
    add_foreign_key :desks, :users, column: :owner_id
  end
end
