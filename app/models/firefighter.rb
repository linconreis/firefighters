class Firefighter < ApplicationRecord

	has_many :pluviometers, dependent: :destroy

end
