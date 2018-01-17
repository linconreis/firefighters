class CreatePluviometers < ActiveRecord::Migration[5.1]
  def change
    create_table :pluviometers do |t|
      t.float :last_twenty_four
      t.float :last_forty_eight
      t.date :date
      t.string :note

      t.timestamps
    end
  end
end
