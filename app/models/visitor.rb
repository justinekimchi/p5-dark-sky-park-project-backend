class Visitor < ApplicationRecord
    validates :username, uniqueness: true, presence: true 
    has_many :bucketlist_locations, :dependent => :destroy
    has_many :dark_sky_parks, through: :bucketlist_locations
    # has_many :likes, :dependent => :destroy
    # has_many :like_parks, through: :likes, source: :dark_sky_park
    # has_many :comments, :dependent => :destroy
    # has_many :com_parks, through: :comments, source: :dark_sky_park
end
