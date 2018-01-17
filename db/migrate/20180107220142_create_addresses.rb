class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.boolean :hydrant, default:false
      t.string :reference_point

      t.timestamps
    end
  end
end
