class SpreadsheetSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :description, :url, :user_id, :created_at, :updated_at
  # model association
  has_many :comments
end
