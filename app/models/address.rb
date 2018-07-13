class Address < ApplicationRecord

belongs_to :district
has_many :event_logs


validates_presence_of :name, message: 'O campo nome da rua não pode ser deixado em branco'


end
