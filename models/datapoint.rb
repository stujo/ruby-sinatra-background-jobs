class Datapoint < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :datapoint
  validates_presence_of :created_at
end
