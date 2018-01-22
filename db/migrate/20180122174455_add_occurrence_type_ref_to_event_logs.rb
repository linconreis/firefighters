class AddOccurrenceTypeRefToEventLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_logs, :occurrence_type, index: true, foreign_key: true
  end
end
