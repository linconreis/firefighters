class ChangeCommandantToBooleanFalseInFireFirefighters < ActiveRecord::Migration[5.1]
  def change
  	change_column :firefighters, :commandant, :boolean, default:false
  end
end
