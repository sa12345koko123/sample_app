class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :list_id
      t.integer :user_id
      t.float :rate, null: false, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
