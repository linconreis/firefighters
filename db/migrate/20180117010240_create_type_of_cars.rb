class CreateTypeOfCars < ActiveRecord::Migration[5.1]
  def change
    create_table :type_of_cars do |t|
      t.string :name

      t.timestamps
    end
  end
end
