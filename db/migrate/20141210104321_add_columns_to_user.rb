class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :zipcode, :string
    add_column :users, :mood, :string
    add_column :users, :picture, :string
  end
end
