class TypeOfCar < ApplicationRecord

	has_many :cars, dependent: :destroy

end
