class CreateJoinTableFirefighterEventLog < ActiveRecord::Migration[5.1]
  def change
    create_join_table :firefighters, :event_logs do |t|
      t.index [:firefighter_id, :event_log_id], name: :idx_firefighter_eventlog
      t.index [:event_log_id, :firefighter_id], name: :idx_eventlog_firefighter
    end
  end
end