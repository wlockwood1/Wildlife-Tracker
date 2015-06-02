class Animal < ActiveRecord::Base
  validates :species, :presence => true
  validates :population, :presence => true
  has_many :sightings
end
