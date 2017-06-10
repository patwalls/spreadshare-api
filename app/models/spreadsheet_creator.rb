class SpreadsheetCreator
  def initialize(options)
    @options = OpenStruct.new(options)
  end

  def create!
    create_user!
    @spreadsheet = Spreadsheet.create!(simple_attributes)
    create_tags!
    @spreadsheet
  end

  private

  def create_user!
    if submitting_user = User.find_by_email(@options.email)
      @user = submitting_user
    else
      @user = User.create!(
        name: 'New User',
        email: @options.email,
        password: 'abc',
        password_confirmation: 'abc'
      )
    end
  end

  def simple_attributes
    {
      title: @options.title,
      description: @options.description,
      url: @options.url,
      category: @options.category,
      user_id: @user.id
    }
  end

  def create_tags!
    tag_names = @options.tags.split(',')
    # TODO strip whitespace
    tag_names.each do |tag_name|
      if tag = Tag.find_by_name(tag_name)
        tag.spreadsheets_tags.create!(spreadsheet_id: @spreadsheet.id)
      else
        tag = Tag.create!(name: tag_name)
        tag.spreadsheets_tags.create!(spreadsheet_id: @spreadsheet.id)
      end
    end
  end
end
