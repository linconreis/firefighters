class RemoveCarFromAbsences < ActiveRecord::Migration[5.1]
  def change
    remove_reference :absences, :car, foreign_key: true
  end
end
