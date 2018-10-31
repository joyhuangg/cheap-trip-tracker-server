class UserSerializer < ActiveModel::Serializer
  has_many :trips
  attributes :id, :name, :email
end
