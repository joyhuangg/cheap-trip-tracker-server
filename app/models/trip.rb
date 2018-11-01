class Trip < ApplicationRecord
  belongs_to :user
  has_many :flights
  has_many :activities
  has_many :hotels, through: :trip_hotels
  has_many :restaurants, through: :trip_restaurants
end
