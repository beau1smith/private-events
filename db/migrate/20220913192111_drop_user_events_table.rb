class DropUserEventsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_events
  end
end
