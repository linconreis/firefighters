class CreateFirefighters < ActiveRecord::Migration[5.1]
  def change
    create_table :firefighters do |t|
      t.string :name
      t.string :last_name
      t.bigint :phone
      t.boolean :type_firefighter
      t.string :type_blood
      t.string :password
      t.string :email
      t.string :registration
      t.date :birth_date

      t.timestamps
    end
  end
end
