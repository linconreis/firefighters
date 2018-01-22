class Car < ApplicationRecord

	belongs_to :type_of_car
	has_many :absences, dependent: :destroy
	has_and_belongs_to_many :event_logs, dependent: :destroy

end
