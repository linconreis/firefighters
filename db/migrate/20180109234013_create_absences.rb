class CreateAbsences < ActiveRecord::Migration[5.1]
  def change
    create_table :absences do |t|
      t.string :justification
      t.time :exit_time
      t.time :return_time
      t.date :date_out
      t.date :return_date
      t.string :responsible_driver
      t.string :passengers

      t.timestamps
    end
  end
end
