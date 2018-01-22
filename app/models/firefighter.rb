class Firefighter < ApplicationRecord

	has_many :pluviometers, dependent: :destroy
	has_and_belongs_to_many :absences, dependent: :destroy

end
