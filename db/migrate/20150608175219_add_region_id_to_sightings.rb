class AddRegionIdToSightings < ActiveRecord::Migration
  def change
    add_reference :sightings, :region, index: true
    add_foreign_key :sightings, :regions
  end
end
