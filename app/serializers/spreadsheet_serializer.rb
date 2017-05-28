class SpreadsheetSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :description, :url, :user_id, :created_at, :updated_at,
             :upvotes_count
  
  # model association
  has_many :comments
  has_many :upvotes

  def upvotes_count
    object.upvotes.count
  end
end
