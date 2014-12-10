class CreateUserSupplements < ActiveRecord::Migration
  def change
    create_table :user_supplements do |t|
      t.references :user, index: true
      t.references :supplement, index: true

      t.timestamps
    end
  end
end
