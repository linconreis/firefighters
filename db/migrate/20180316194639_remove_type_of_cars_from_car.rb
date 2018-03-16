class RemoveTypeOfCarsFromCar < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :cars, :type_of_cars, foreign_key: true
  end
end
