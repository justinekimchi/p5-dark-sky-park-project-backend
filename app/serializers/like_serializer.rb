class LikeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :visitor
  has_one :dark_sky_park
end
