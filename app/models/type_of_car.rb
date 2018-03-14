class TypeOfCar < ApplicationRecord

has_many :cars

validates_presence_of :name, message: 'O campo nome não pode ser deixado em branco'
validates_uniqueness_of :name, message: 'Tipo de viatura já cadastrada'

end
