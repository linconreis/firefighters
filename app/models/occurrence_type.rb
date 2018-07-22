class OccurrenceType < ApplicationRecord

	has_many :event_logs

  validates_presence_of :name, message: 'O campo nome não pode ser deixado em branco'
  validates_presence_of :code, message: 'O campo código não pode ser deixado em branco'

  validates_uniqueness_of :code, :case_sensitive => false, message: 'Código já cadastrado'
  validates_uniqueness_of :name, :case_sensitive => false, message: 'Nome já cadastrado'

end
