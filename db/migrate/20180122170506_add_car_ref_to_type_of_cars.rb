class AddCarRefToTypeOfCars < ActiveRecord::Migration[5.1]
  def change
  	add_reference :type_of_cars, :car, index: true, foreign_key: true
  end
end
