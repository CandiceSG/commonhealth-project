class CreateUserMedications < ActiveRecord::Migration
  def change
    create_table :user_medications do |t|
      t.references :user, index: true
      t.references :medication, index: true

      t.timestamps
    end
  end
end
