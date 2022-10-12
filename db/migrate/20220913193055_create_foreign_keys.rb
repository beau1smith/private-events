class CreateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :events, :users, column: :creator_id
    add_foreign_key :rsvps, :events, column: :attended_event_id
    add_foreign_key :rsvps, :users, column: :attendee_id
  end
end
