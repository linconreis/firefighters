class District < ApplicationRecord

	has_many :addresses, dependent: :destroy

end
