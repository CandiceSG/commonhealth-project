class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :sender, index: true
      t.string :receiver
      t.string :references
      t.string :status

      t.timestamps
    end
  end
end
