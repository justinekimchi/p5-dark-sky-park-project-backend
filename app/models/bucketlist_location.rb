class BucketlistLocation < ApplicationRecord
  belongs_to :visitor
  belongs_to :dark_sky_park
  validates :dark_sky_park_id, uniqueness:{scope: :visitor_id}
end
