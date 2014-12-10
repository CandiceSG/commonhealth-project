class CreateWellbeings < ActiveRecord::Migration
  def change
    create_table :wellbeings do |t|
      t.string :description

      t.timestamps
    end
  end
end
