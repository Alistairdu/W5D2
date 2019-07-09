class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :subs, :user_id
    add_index :subs, :title
  end
end
