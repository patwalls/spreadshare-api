class SpreadsheetsTag < ApplicationRecord
  belongs_to :spreadsheet
  belongs_to :tag
end
