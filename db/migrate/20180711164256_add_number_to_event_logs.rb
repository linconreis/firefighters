class AddNumberToEventLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :event_logs, :number, :integer
  end
end
