class UserSerializer < ActiveModel::Serializer
  attributes :id, :imei, :status, :nin
  has_many :movements
end
