class LinkActivitytype < ApplicationRecord
  belongs_to :activity
  belongs_to :activitytypes
end
