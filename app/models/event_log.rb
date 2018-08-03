class EventLog < ApplicationRecord

	belongs_to :occurrence_type
	belongs_to :address, optional: true
	has_and_belongs_to_many :cars
	has_and_belongs_to_many :firefighters

  validates_presence_of :date, message: 'O campo data não pode ser deixado em branco'
  validates_presence_of :exit_time, message: 'O campo horário de saída não pode ser deixado em branco'
  validates_presence_of :return_time, message: 'O campo horário de retorno não pode ser deixado em branco'
  validates_presence_of :requester, message: 'O campo solicitante não pode ser deixado em branco'
  validates_presence_of :phone, message: 'O campo telefone não pode ser deixado em branco'
  validates_presence_of :descriptive_memorial, message: 'O campo memorial descritivo não pode ser deixado em branco'
  validates_presence_of :measures_taken, message: 'O campo providências tomadas não pode ser deixado em branco'
  #validates_presence_of :comments, message: 'O campo observações não pode ser deixado em branco'
  validates_presence_of :climate_conditions, message: 'O campo climático não pode ser deixado em branco'
  validates_presence_of :address, message: 'O campo endereço não pode ser deixado em branco'
  validates_presence_of :number, message: 'O campo número do endereço não pode ser deixado em branco'
  validates_presence_of :firefighters, message: 'Deve conter pelo menos um bombeiro envolvido'
  validates_presence_of :cars, message: 'Deve conter pelo menos uma viatura envolvida'


end
