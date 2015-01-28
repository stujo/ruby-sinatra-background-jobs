class Location < ActiveRecord::Base
  has_many :datapoints
  validates_presence_of :location
  validates_uniqueness_of :location
  validates_presence_of :active
end