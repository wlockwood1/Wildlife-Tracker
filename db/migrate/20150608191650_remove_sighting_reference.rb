class RemoveSightingReference < ActiveRecord::Migration
  def change
    remove_reference :sightings, :region, index: true
  end
end
