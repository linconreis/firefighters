class CreateJoinTableCarEventLog < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cars, :event_logs do |t|
       t.index [:car_id, :event_log_id]
       t.index [:event_log_id, :car_id]
    end
  end
end
