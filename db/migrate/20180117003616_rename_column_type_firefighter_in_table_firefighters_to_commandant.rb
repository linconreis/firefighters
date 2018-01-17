class RenameColumnTypeFirefighterInTableFirefightersToCommandant < ActiveRecord::Migration[5.1]
  def change
  	rename_column :firefighters, :type_firefighter, :commandant
  end
end
