class District < ApplicationRecord

	has_many :addresses, dependent: :destroy

	validates_presence_of :name, message: 'O campo nome não pode ser deixado em branco'
	validates_uniqueness_of :name, :case_sensitive => false, message: 'Bairro já cadastrado'

end
