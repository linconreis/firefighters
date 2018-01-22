class AddAddressRefToEventLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_logs, :address, index: true, foreign_key: true
  end
end
