class EventLog < ApplicationRecord

	belongs_to :occurrence_type
	belongs_to :address

end
