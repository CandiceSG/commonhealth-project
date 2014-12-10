class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
