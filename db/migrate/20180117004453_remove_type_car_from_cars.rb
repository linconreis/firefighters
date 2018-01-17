class RemoveTypeCarFromCars < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :type_car, :string
  end
end
