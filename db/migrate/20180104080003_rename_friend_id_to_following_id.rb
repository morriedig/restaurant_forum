class RenameFriendIdToFollowingId < ActiveRecord::Migration[5.1]
  def change
    rename_column :followships, :friend_id, :following_id
  end
end
