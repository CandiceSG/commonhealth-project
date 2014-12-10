class CreateUserWellbeings < ActiveRecord::Migration
  def change
    create_table :user_wellbeings do |t|
      t.references :user, index: true
      t.references :wellbeing, index: true

      t.timestamps
    end
  end
end
