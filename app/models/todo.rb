class Todo < ActiveRecord::Base
  belongs_to :destination

  validates_presence_of :details
end
