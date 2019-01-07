class AddMileageToAbsences < ActiveRecord::Migration[5.1]
  def change
    add_column :absences, :milage_output, :bigint
    add_column :absences, :milage_return, :bigint
  end
end
