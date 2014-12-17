class RemoveColumnDestroyFromFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships, :destroy, :string
  end
end
