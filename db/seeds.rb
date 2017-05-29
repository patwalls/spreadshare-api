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

user.spreadsheets.create!(
  title: 'My first spreadsheet',
  url: 'http://google.com',
  description: 'This is a description for my spreadsheet',
  category: 'Finance',
  format: 'list'
)

user.spreadsheets.create!(
  title: 'Another fun spreadsheet',
  url: 'http://google.com',
  description: 'A fun description',
  category: 'People',
  format: 'list'
)

user.spreadsheets.create!(
  title: 'The best spreadsheet of all',
  url: 'http://google.com',
  description: 'This is a description for my spreadsheet',
  category: 'Finance',
  format: 'list'
)
