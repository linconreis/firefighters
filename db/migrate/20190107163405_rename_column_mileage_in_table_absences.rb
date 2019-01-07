class RenameColumnMileageInTableAbsences < ActiveRecord::Migration[5.1]
  def change
    rename_column :absences, :milage_return, :mileage_return
    rename_column :absences, :milage_output, :mileage_output
  end
end
