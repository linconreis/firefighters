class RemovePassengersFromAbsences < ActiveRecord::Migration[5.1]
  def change
    remove_column :absences, :passengers, :string
  end
end
