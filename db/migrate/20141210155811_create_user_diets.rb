class CreateUserDiets < ActiveRecord::Migration
  def change
    create_table :user_diets do |t|
      t.references :user, index: true
      t.references :diet, index: true

      t.timestamps
    end
  end
end
