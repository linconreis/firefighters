class Car < ApplicationRecord

	belongs_to :type_of_car
	has_and_belongs_to_many :absences
	has_and_belongs_to_many :event_logs


  validates_presence_of :name, message: 'O campo nome não pode ser deixado em branco'
  validates_presence_of :brand, message: 'O campo marca não pode ser deixado em branco'
  validates_presence_of :board, message: 'O campo placa não pode ser deixado em branco'
  validates_presence_of :year, message: 'O campo ano não pode ser deixado em branco'
  validates_presence_of :mileage, message: 'O campo quilometragem não pode ser deixado em branco'
  validates_presence_of :number, message: 'O campo número não pode ser deixado em branco'

  validates_uniqueness_of :board, :case_sensitive => false, message: 'Placa de viatura já cadastrada'
  validates_uniqueness_of :number, :case_sensitive => false, message: 'Número de viatura já cadastrada'

end
