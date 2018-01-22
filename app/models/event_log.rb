class EventLog < ApplicationRecord

	belongs_to :occurrence_type
	belongs_to :address
	has_and_belongs_to_many :cars, dependent: :destroy

end
