class CreateJoinTableFirefighterAbsence < ActiveRecord::Migration[5.1]
  def change
    create_join_table :firefighters, :absences do |t|
       t.index [:firefighter_id, :absence_id]
       t.index [:absence_id, :firefighter_id]
    end
  end
end
