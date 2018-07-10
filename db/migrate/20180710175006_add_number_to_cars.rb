class AddNumberToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :number, :integer
  end
end
