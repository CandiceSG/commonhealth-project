class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.text :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
