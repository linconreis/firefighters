class Pluviometer < ApplicationRecord

	belongs_to :firefighter

  validates_presence_of :date, message: 'O campo data do evento não pode ser deixado em branco'
  validates_presence_of :last_twenty_four, message: 'O campo chuva das últ. 24hrs não pode ser deixado em branco'
  validates_presence_of :last_forty_eight, message: 'O campo chuva das últ. 48hrs não pode ser deixado em branco'

  validates_uniqueness_of :date, message: 'Data do evento já cadastrada'


end
