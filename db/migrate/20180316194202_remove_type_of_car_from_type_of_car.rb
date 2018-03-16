class RemoveTypeOfCarFromTypeOfCar < ActiveRecord::Migration[5.1]
  def down
  	remove_reference :cars, :type_of_cars, foreign_key: true
  end

  def up
  	add_reference :cars, :type_of_car, index: true, foreign_key: true
  end
end
