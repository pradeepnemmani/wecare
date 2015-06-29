class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.string :comment

      t.timestamps
    end
    add_index :comments, :micropost_id
  end
end
