class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :sender, index: true
      t.string :receiver
      t.string :references
      t.string :status

      t.timestamps
    end
  end
end
