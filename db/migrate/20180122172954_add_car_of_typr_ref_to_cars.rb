class AddCarOfTyprRefToCars < ActiveRecord::Migration[5.1]
  def change
    add_reference :cars, :type_of_cars, index: true, foreign_key: true
  end
end
