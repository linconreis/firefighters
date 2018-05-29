class RemoveOndutyFromEventLogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :event_logs, :on_duty, :string
  end
end
