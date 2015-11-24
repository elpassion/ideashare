class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.integer :owner_id, null: false
      t.integer :desk_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :ideas, :users, column: :owner_id
    add_foreign_key :ideas, :desks
  end
end
