class Absence < ApplicationRecord

	belongs_to :car
	has_and_belongs_to_many :firefighters, dependent: :destroy

end
