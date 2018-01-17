class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.string :board
      t.string :type_car
      t.bigint :mileage

      t.timestamps
    end
  end
end
