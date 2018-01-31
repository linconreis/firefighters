class Firefighter < ApplicationRecord
 require 'digest'
 before_create :encrypt_password
 before_update :encrypt_password
	
	has_many :pluviometers, dependent: :destroy
	has_and_belongs_to_many :absences, dependent: :destroy


private 

	def encrypt_password
	  self.password = Digest::SHA256.hexdigest self.password
	end

end
