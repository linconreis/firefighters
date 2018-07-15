class Address < ApplicationRecord

  belongs_to :district
  has_many :event_logs


  validates_presence_of :name, message: 'O campo nome da rua não pode ser deixado em branco'

  def name_with_district_name
    "#{name} (#{district.name})"
  end


end
