class TripSerializer < ActiveModel::Serializer
  has_many :flights, :activities, :hotels, :restaurants
  attributes :id, :name, :user, :location, :start_date, :end_date, :num_ppl, :price, :longitude, :latitude
end
