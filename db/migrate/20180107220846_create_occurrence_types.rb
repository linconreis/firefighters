class CreateOccurrenceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrence_types do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
