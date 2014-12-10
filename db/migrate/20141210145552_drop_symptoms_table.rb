class DropSymptomsTable < ActiveRecord::Migration
  def up
    drop_table :symptoms
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
