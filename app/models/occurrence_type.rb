class OccurrenceType < ApplicationRecord

	has_many :envent_logs, dependent: :destroy
end
