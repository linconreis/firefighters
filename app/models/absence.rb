class Absence < ApplicationRecord

	has_and_belongs_to_many :cars
	has_and_belongs_to_many :firefighters

end
