class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :microposts, :user_id
  end
end
