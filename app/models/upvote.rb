class Upvote < ApplicationRecord
  validates_uniqueness_of :spreadsheet_id, :scope => :user_id
end
