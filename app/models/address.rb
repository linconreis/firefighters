class Address < ApplicationRecord

belongs_to :district
has_many :event_logs, dependent: :destroy

end
