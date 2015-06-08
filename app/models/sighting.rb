class Sighting < ActiveRecord::Base

  validates :date, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :region, :presence => true

  validates_numericality_of :latitude, greater_than: 45.47, less_than: 45.58
  validates_numericality_of :longitude, greater_than: -122.73, less_than: -122.63

  belongs_to :animal
  belongs_to :region

end
