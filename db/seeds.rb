# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_params = {
  name: 'Pat Walls',
  email: 'test@test.com',
  password: 'abc',
  password_confirmation: 'abc'
}

user = User.create!(user_params)
auth_token = AuthenticateUser.new(user.email, user.password).call

s1 = user.spreadsheets.create!(
  title: 'My first spreadsheet',
  url: 'http://google.com',
  description: 'This is a description for my spreadsheet',
  category: 'Finance',
  format: 'list',
  live: true
)

s1.comments.create!(
  body: 'This is a comment',
  created_by: user.id
)

s1.comments.create!(
  body: 'This is another comment',
  created_by: user.id
)

s2 = user.spreadsheets.create!(
  title: 'Another fun spreadsheet',
  url: 'http://google.com',
  description: 'A fun description',
  category: 'People',
  format: 'list',
  live: true
)

s2.comments.create!(
  body: 'This is also a comment',
  created_by: user.id
)

s3 = user.spreadsheets.create!(
  title: 'The best spreadsheet of all',
  url: 'http://google.com',
  description: 'This is a description for my spreadsheet',
  category: 'Finance',
  format: 'list',
  live: true
)

s4 = user.spreadsheets.create!(
  title: 'Another finance spreadsheet',
  url: 'http://google.com',
  description: 'This is a description for my spreadsheet',
  category: 'Finance',
  format: 'list',
  live: true
)

t1 = Tag.create!(name: 'people')
t2 = Tag.create!(name: 'finance')
t3 = Tag.create!(name: 'product')

SpreadsheetsTag.create!(spreadsheet_id: s1.id, tag_id: t1.id)
SpreadsheetsTag.create!(spreadsheet_id: s2.id, tag_id: t2.id)
SpreadsheetsTag.create!(spreadsheet_id: s3.id, tag_id: t1.id)
SpreadsheetsTag.create!(spreadsheet_id: s3.id, tag_id: t2.id)
SpreadsheetsTag.create!(spreadsheet_id: s3.id, tag_id: t3.id)
SpreadsheetsTag.create!(spreadsheet_id: s4.id, tag_id: t3.id)
