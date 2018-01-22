class AddFirefightersRefToPluviometers < ActiveRecord::Migration[5.1]
  def change
  	add_reference :pluviometers, :firefighter, index: true, foreign_key: true
  end
end
