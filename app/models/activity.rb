class Activity < ApplicationRecord
  belongs_to :trip, optional: true
end
