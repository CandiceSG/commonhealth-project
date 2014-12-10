class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :description

      t.timestamps
    end
  end
end
