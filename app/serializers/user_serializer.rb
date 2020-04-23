class UserSerializer < ActiveModel::Serializer
  attributes :id, :imei, :status, :nin
  has_many :hot_spots,  through: :movements
end
