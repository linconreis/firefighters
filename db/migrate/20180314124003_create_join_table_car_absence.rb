class CreateJoinTableCarAbsence < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cars, :absences do |t|
      t.index [:car_id, :absence_id]
      t.index [:absence_id, :car_id]
    end
  end
end
