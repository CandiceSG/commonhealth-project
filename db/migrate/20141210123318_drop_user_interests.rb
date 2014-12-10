class DropUserInterests < ActiveRecord::Migration
  def up
    drop_table :user_interests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
