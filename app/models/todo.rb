class Todo < ActiveRecord::Base
  belongs_to :destination
  geocoded_by :location
  before_save :geocode, if: :location_changed?

  validates_presence_of :details
  validates_presence_of :location
end
