class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :description

      t.timestamps
    end
  end
end
