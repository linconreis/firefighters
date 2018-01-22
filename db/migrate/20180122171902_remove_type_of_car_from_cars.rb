class RemoveTypeOfCarFromCars < ActiveRecord::Migration[5.1]
  def change
    remove_reference :type_of_cars, :car, foreign_key: true
  end
end
