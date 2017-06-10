class Spreadsheet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :upvotes
  has_many :spreadsheets_tags
  has_many :tags, through: :spreadsheets_tags

  scope :live, -> { where(live: true) }
end
