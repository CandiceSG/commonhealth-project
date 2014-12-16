class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :sender, index: true
      t.references :receiver, index: true
      t.string :status

      t.timestamps
    end
  end
end
