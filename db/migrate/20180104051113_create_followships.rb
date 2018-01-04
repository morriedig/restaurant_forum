class CreateFollowships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :agree, default: false

      t.timestamps
    end
    add_index :followships, :user_id
  end
end
