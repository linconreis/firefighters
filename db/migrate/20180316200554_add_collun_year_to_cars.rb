class AddCollunYearToCars < ActiveRecord::Migration[5.1]
  def change
  	 add_column :cars, :year, :bigint
  end
end
