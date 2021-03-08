class DarkSkyParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :img_url, :city, :state
end
