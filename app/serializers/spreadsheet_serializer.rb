class SpreadsheetSerializer < ActiveModel::Serializer
  # raw attributes
  attributes :id, :title, :description, :url, :category, :format

  # model associations -> return collections
  belongs_to :user
  has_many :comments
  has_many :upvotes

  # custom attributes
  attributes :upvotes_count, :upvoted, :submitted, :created, :tag_names

  def tag_names
    object.tags.map(&:name)
  end

  def upvotes_count
    object.upvotes.count
  end

  def upvoted
    object.upvotes.where(user_id: current_user.id).any?
  end

  def submitted
    object.user_id == current_user.id
  end

  def created
    object.user_id == current_user.id
  end
end
