class Car < ApplicationRecord

	belongs_to :type_of_car
	has_many :absences, dependent: :destroy

end
