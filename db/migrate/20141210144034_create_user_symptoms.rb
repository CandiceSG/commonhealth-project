class CreateUserSymptoms < ActiveRecord::Migration
  def change
    create_table :user_symptoms do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
