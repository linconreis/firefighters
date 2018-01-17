class AddDistricRefToAddresses < ActiveRecord::Migration[5.1]
  def change
  	add_reference :addresses, :district, index: true, foreign_key: true
  end
end
