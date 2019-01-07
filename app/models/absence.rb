class Absence < ApplicationRecord

	has_and_belongs_to_many :cars
	has_and_belongs_to_many :firefighters

  validates_presence_of :date_out, message: 'O campo data de saída não pode ser deixado em branco'
  validates_presence_of :exit_time, message: 'O campo horário de saída não pode ser deixado em branco'
  validates_presence_of :return_date, message: 'O campo data de retorno não pode ser deixado em branco'
  validates_presence_of :return_time, message: 'O campo horário de retorno não pode ser deixado em branco'
  validates_presence_of :return_time, message: 'O campo horário de retorno não pode ser deixado em branco'
  validates_presence_of :mileage_output, message: 'O campo Km de saída não pode ser deixado em branco'
  validates_presence_of :mileage_return, message: 'O campo Km de retorno não pode ser deixado em branco'
  validates_presence_of :justification, message: 'O campo horário de retorno não pode ser deixado em branco'
  validates_presence_of :firefighters, message: 'A ausência deve ter pelo menos um bombeiro envolvido'
  validates_presence_of :cars, message: 'A ausência deve ter pelo menos um carro envolvido'

end
