class AddColumnParticipationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :participation, :boolean
  end
end
