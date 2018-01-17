class CreateEventLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :event_logs do |t|
      t.bigint :phone
      t.date :date
      t.time :exit_time
      t.time :return_time
      t.string :requester
      t.string :descriptive_memorial
      t.string :measures_taken
      t.string :comments
      t.string :on_duty 
      t.string :climate_conditions
      t.boolean :finished, default:false

      t.timestamps
    end
  end
end
