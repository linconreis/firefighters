class Address < ApplicationRecord

belongs_to :district
has_many :event_logs


validates_presence_of :name, message: 'O campo nome não pode ser deixado em branco'
validates_uniqueness_of :name, message: 'Rua já cadastrada'

end
