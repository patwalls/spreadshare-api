class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :spreadsheets, foreign_key: :user_id
  has_many :upvotes
  # Validations
  validates_presence_of :name, :email, :password_digest

  # # TODO a 'real' soft delete implementation...
  # def spreadsheets
  #   spreadsheets.where(deleted_at: nil)
  # end

  def upvoted_spreadsheets
    Spreadsheet.joins(:upvotes).where('upvotes.user_id = ?', id)
  end

  def submitted_spreadsheets
    spreadsheets
  end

  def created_spreadsheets
    spreadsheets
  end
end
