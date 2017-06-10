class SpreadsheetSerializer < ActiveModel::Serializer
  # raw attributes
  attributes :id, :title, :description, :url, :category, :format

  # model associations -> return collections
  belongs_to :user
  # has_many :comments
  has_many :upvotes

  # custom attributes
  attributes :upvotes_count, :tag_names, :contributors, :creators, :related_spreadsheets

  def tag_names
    object.tags.map(&:name)
  end

  def upvotes_count
    object.upvotes.count
  end

  # def upvoted
  #   object.upvotes.where(user_id: current_user.id).any?
  # end
  #
  # def submitted
  #   object.user_id == current_user.id
  # end
  #
  # def created
  #   object.user_id == current_user.id
  # end

  def contributors
    [{name: 'Pat Walls', url: 'http://google.com'}]
  end

  def creators
    [{name: 'Pat Walls', url: 'http://google.com'}]
  end

  def related_spreadsheets
    Spreadsheet
      .where(category: object.category)
      .where('id != ?', object.id)
  end
end
