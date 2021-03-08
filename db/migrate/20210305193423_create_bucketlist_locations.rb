class CreateBucketlistLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :bucketlist_locations do |t|
      t.references :visitor, null: false, foreign_key: true
      t.references :dark_sky_park, null: false, foreign_key: true
      t.boolean :visited, default: false
    end
  end
end
