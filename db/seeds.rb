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
).tap(&:save!)

LoadFunds.new.call(user: admin, amount: 300)

another_user = BuildConfirmedUser.new.call(
  first_name: 'Fuad',
  last_name: 'Saud',
  email: 'fuadksd@gmail.com',
  password: 'q1w2e3r4'
).tap(&:save!)

LoadFunds.new.call(user: another_user, amount: 100)

Category.create!([
  { media_content_type: 'song',    name: 'Jazz' },
  { media_content_type: 'book',    name: 'Sci-Fi & Fantasy' },
  { media_content_type: 'video',   name: 'Documentary' },
  { media_content_type: 'podcast', name: 'Arts' },
  { media_content_type: 'podcast', name: 'Business' },
  { media_content_type: 'podcast', name: 'Comedy' },
  { media_content_type: 'podcast', name: 'Education' },
  { media_content_type: 'podcast', name: 'Games & Hobbies' },
  { media_content_type: 'podcast', name: 'Government & Organizations' },
  { media_content_type: 'podcast', name: 'Health' },
  { media_content_type: 'podcast', name: 'Kids & Family' },
  { media_content_type: 'podcast', name: 'Music' },
  { media_content_type: 'podcast', name: 'News & Politics' },
  { media_content_type: 'podcast', name: 'Religion & Spirituality' },
  { media_content_type: 'podcast', name: 'Science & Medicine' },
  { media_content_type: 'podcast', name: 'Society & Culture' },
  { media_content_type: 'podcast', name: 'Sports & Recreation' },
  { media_content_type: 'podcast', name: 'Technology' },
  { media_content_type: 'podcast', name: 'TV & Film' },
])

Song.create!(
  {
    duration: 4,
    medium_attributes: {
      title: 'Wona',
      description: 'lalal',
      price:  0.99,
      author: admin,
      category: Category.find_by(name: 'Jazz')
    }
  }
)

Video.create!(
  {
    duration: 8,
    medium_attributes: {
      title: 'Moises',
      description: 'Não consegue',
      price: 1_000_000,
      author: another_user,
      category: Category.find_by(name: 'Documentary')
    }
  }
)

Podcast.create!(
  {
    duration: 45,
    medium_attributes: {
      title: 'Mupoca #50',
      description: 'mas o que é',
      price: 0,
      author: another_user,
      category: Category.find_by(name: 'Arts')
    }
  }
)

Book.create!([
  {
    page_count: 657,
    medium_attributes: {
      title: 'Alice in wonderland',
      description: 'Down the rabbit hole',
      price: 14.5,
      author: admin,
      category: Category.find_by(name: 'Sci-Fi & Fantasy'),
    }
  },
  {
    page_count: 1500,
    medium_attributes: {
      title: 'The Lord of the Rings',
      description: "They're taking the hobbits to Isengard",
      price: 150.9,
      author: another_user,
      category: Category.find_by(name: 'Sci-Fi & Fantasy'),
    }
  },
  {
    page_count: 200,
    medium_attributes: {
      title: 'Some random book',
      description: 'foo',
      price: 12.9,
      author: another_user,
      category: Category.find_by(name: 'Education'),
    }
  }
])
