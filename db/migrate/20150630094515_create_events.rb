class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :on_date
      t.string :end_date
      t.integer :user_id

      t.timestamps
    end
    add_index :events, :user_id
  end
end
