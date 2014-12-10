class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user_interest, index: true

      t.timestamps
    end
  end
end
