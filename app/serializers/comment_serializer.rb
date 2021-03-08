class CommentSerializer < ActiveModel::Serializer
  attributes :id, :post
  has_one :visitor
  has_one :dark_sky_park
end
