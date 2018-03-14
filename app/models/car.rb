class Car < ApplicationRecord

	belongs_to :type_of_car
	has_and_belongs_to_many :absences
	has_and_belongs_to_many :event_logs

end
