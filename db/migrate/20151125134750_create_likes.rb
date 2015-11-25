class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :user_id
      t.string :likeable_type
      t.integer :likeable_id
      t.timestamps null: false
    end
  end
end
