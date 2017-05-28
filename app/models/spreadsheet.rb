class Spreadsheet < ApplicationRecord
  has_many :comments
  has_many :upvotes
end
