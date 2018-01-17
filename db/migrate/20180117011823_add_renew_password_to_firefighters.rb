class AddRenewPasswordToFirefighters < ActiveRecord::Migration[5.1]
  def change
  	add_column :firefighters, :renew_password, :boolean, default:true
  end
end
