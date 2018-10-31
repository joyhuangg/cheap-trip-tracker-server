class Trip < ApplicationRecord
  belongs_to :user
  has_many :flights
  has_many :activities
  has_many :hotels
  has_many :restaurants
end
