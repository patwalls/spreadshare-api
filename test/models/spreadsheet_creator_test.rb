require 'test_helper'
require 'minitest/autorun'

describe SpreadsheetCreator do
  subject { SpreadsheetCreator }

  before do
    Spreadsheet.destroy_all
    User.destroy_all
    Tag.destroy_all
    SpreadsheetsTag.destroy_all
  end

  let(:params) do
    {
      title: 'My Spreadsheet',
      description: 'This is a description',
      url: 'http://google.com/sheets/helloworld',
      category: 'Finance',
      tags: 'people,finance',
      creator: 'bill22',
      submitter: 'john23',
      email: 'patrickswalls@gmail.com'
    }
  end

  let(:user) { User.find_by_email(params[:email])}

  it 'creates spreadsheet' do
    spreadsheet = subject.new(params).create!
    assert spreadsheet.title == params[:title]
  end

  it 'creates user' do
    spreadsheet = subject.new(params).create!
    assert user.email == params[:email]
  end

  it 'creates tags' do
    spreadsheet = subject.new(params).create!
    assert spreadsheet.tags.count == 2
    assert spreadsheet.tags[0].name == 'people'
    assert spreadsheet.tags[1].name == 'finance'
  end

  describe 'if user already exists' do
    before do
      User.create!(
        name: 'New User',
        email: params[:email],
        password: 'abc',
        password_confirmation: 'abc'
      )
    end

    it 'associates that user' do
      spreadsheet = subject.new(params).create!
      assert User.all.count == 1
      assert spreadsheet.user_id == user.id
    end
  end

  describe 'if tag already exists' do
    before do
      @tag = Tag.create!(name: 'people')
    end

    it 'uses that tag in association' do
      spreadsheet = subject.new(params).create!
      assert Tag.all.count == 2
      tag = spreadsheet.tags.find_by_name('people')
      spreadsheets_tag = SpreadsheetsTag.where(tag_id: tag.id, spreadsheet_id: spreadsheet.id)
      assert spreadsheets_tag
    end
  end
end
