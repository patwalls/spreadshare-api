class Tag < ApplicationRecord
  has_many :spreadsheets_tags
  has_many :spreadsheets, through: :spreadsheets_tags
end
