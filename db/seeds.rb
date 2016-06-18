# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = BuildConfirmedUser.new.call(
    first_name: 'John',
    last_name: 'Doe',
    email: 'admin@unitunes.com',
    password: 'admin123',
    admin: true,
).tap(&:save)

another_user = BuildConfirmedUser.new.call(
  first_name: 'Fuad',
  last_name: 'Saud',
  email: 'fuadksd@gmail.com',
  password: 'q1w2e3r4'
).tap(&:save)

categories = Category.create!([
  { name: 'Fantasy' },
  { name: 'Sci-Fi' }
])

Medium.create!([
  {
    title: 'Alice in wonderland',
    description: 'Down the rabbit hole',
    price: 14.5,
    author: admin,
    category: Category.first
  },
  {
    title: 'The Lord of the Rings',
    description: "They're taking the hobbits to Isengard",
    price: 150.9,
    author: another_user,
    category: Category.first
  }
])
