class Firefighter < ApplicationRecord
 require 'digest'
 before_create :encrypt_password
 #before_update :encrypt_password
	
	has_many :pluviometers
	has_and_belongs_to_many :absences
	has_and_belongs_to_many :event_logs

validates_presence_of :name, message: 'O campo nome não pode ser deixado em branco'
validates_presence_of :last_name, message: 'O campo sobrenome não pode ser deixado em branco'
validates_presence_of :registration, message: 'O campo código de matricula não pode ser deixado em branco'
validates_presence_of :phone, message: 'O campo telefone não pode ser deixado em branco'
validates_presence_of :birth_date, message: 'O campo data de nascimento não pode ser deixado em branco'
validates_presence_of :type_blood, message: 'O campo tipo sanguíneo não pode ser deixado em branco'
#validates_presence_of :commandant, message: 'O campo comandante não pode ser deixado em branco'
#validates_presence_of :renew_password, message: 'O campo renovar senha não pode ser deixado em branco'
validates_presence_of :email, message: 'O campo email não pode ser deixado em branco'


validates_uniqueness_of :registration, message: 'Matricula já cadastrada'
validates_uniqueness_of :email, message: 'E-mail já cadastrado'


private 

	def encrypt_password
	  self.password = Digest::SHA256.hexdigest self.password
	end

end
