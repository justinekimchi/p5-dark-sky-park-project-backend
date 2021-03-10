class DarkSkyPark < ApplicationRecord
    has_many :bucketlist_locations
    has_many :visitors, through: :bucketlist_locations
    # has_many :likes
    # has_many :like_visitors, through: :likes, source: :visitor
    # has_many :comments
    # has_many :com_visitors, through: :comments, source: :visitor
end
