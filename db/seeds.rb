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
  { media_content_type: 'Song',    name: 'Jazz' },
  { media_content_type: 'Book',    name: 'Sci-Fi & Fantasy' },
  { media_content_type: 'Video',   name: 'Documentary' },
  { media_content_type: 'Podcast', name: 'Arts' },
  { media_content_type: 'Podcast', name: 'Business' },
  { media_content_type: 'Podcast', name: 'Comedy' },
  { media_content_type: 'Podcast', name: 'Education' },
  { media_content_type: 'Podcast', name: 'Games & Hobbies' },
  { media_content_type: 'Podcast', name: 'Government & Organizations' },
  { media_content_type: 'Podcast', name: 'Health' },
  { media_content_type: 'Podcast', name: 'Kids & Family' },
  { media_content_type: 'Podcast', name: 'Music' },
  { media_content_type: 'Podcast', name: 'News & Politics' },
  { media_content_type: 'Podcast', name: 'Religion & Spirituality' },
  { media_content_type: 'Podcast', name: 'Science & Medicine' },
  { media_content_type: 'Podcast', name: 'Society & Culture' },
  { media_content_type: 'Podcast', name: 'Sports & Recreation' },
  { media_content_type: 'Podcast', name: 'Technology' },
  { media_content_type: 'Podcast', name: 'TV & Film' },
])

Song.create!(
  {
    duration: 4,
    medium_attributes: {
      title: 'Some Song',
      description: 'some desc',
      price:  0.99,
      author: admin,
      category: Category.find_by(name: 'Jazz'),
      file: 'http://www.stephaniequinn.com/Music/Mozart%20-%20Presto.mp3'
    }
  }
)

Video.create!(
  {
    duration: 8,
    medium_attributes: {
      title: 'Some Vide Sample',
      description: 'Some Video Description',
      price: 1_000_000,
      author: another_user,
      category: Category.find_by(name: 'Documentary'),
      file: 'http://techslides.com/demos/sample-videos/small.webm'
    }
  }
)

Podcast.create!(
  {
    duration: 45,
    medium_attributes: {
      title: 'Mupoca #49',
      description: 'some desc',
      price: 0,
      author: another_user,
      category: Category.find_by(name: 'Arts'),
      file: 'http://ec-media.sndcdn.com/uuEaIRkULzp1?f10880d39085a94a0418a7ef61b03d5275edf83695e0cd6a5a31b904eeb2765fe88087d7130821dc9bc3053a307d8c5e49ef90569c00b0c9f05a7bf4ca'
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
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'http://www.freebooks.com/wp-content/uploads/2013/04/alice-alice-in-wonderland.jpg',
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
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'http://sites.psu.edu/saupassion2/wp-content/uploads/sites/40606/2016/04/lord-of-the-rings-book-cover.jpg'
    },
  },
  {
    page_count: 600,
    medium_attributes: {
      title: 'Em Algum Lugar nas Estrelas',
      description: "Em Algum Lugar nas Estrelas, da autora norte-americana Clare Vanderpool, é um romance intenso sobre a difícil arte de crescer em um mundo que nem sempre parece satisfeito com a nossa presença. Pelo menos é desse jeito que as coisas têm acontecido para Jack Baker.",
      price: 35.45,
      author: another_user,
      category: Category.find_by(name: 'Kids & Family'),
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51MazpZa9qL._SX332_BO1,204,203,200_.jpg'
    },
  },
  {
    page_count: 800,
    medium_attributes: {
      title: 'Campos de Batalha - Volume 1',
      description: "Verão, 1942. Enquanto o exército alemão esmaga sua oposição avançando bem fundo na Rússia Soviética e os defensores da Pátria-Mãe batem desbaratados em retirada, um novo esquadrão bombardeiro chega na base aérea.",
      price: 135.45,
      author: another_user,
      category: Category.find_by(name: 'Kids & Family'),
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51GJnt6Ua0L._SX329_BO1,204,203,200_.jpg'
    },
  },
  {
    page_count: 800,
    medium_attributes: {
      title: 'Do Inferno',
      description: "Verão, 1942. Enquanto o exército alemão esmaga sua oposição avançando bem fundo na Rússia Soviética e os defensores da Pátria-Mãe batem desbaratados em retirada, um novo esquadrão bombardeiro chega na base aérea.",
      price: 85.0,
      author: another_user,
      category: Category.find_by(name: 'Kids & Family'),
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51d8liekU0L._SX371_BO1,204,203,200_.jpg'
    },
  },

  {
    page_count: 232,
    medium_attributes: {
      title: 'Do A Liga Extraordinária. Século-Integral - Volume 1',
      description: "Outrora houve uma Liga de aventureiros extraordinários. Depois se sucederam cem anos do cruel mundo moderno... E aí não sobrou ninguém.",
      price: 109.0,
      author: another_user,
      category: Category.find_by(name: 'Kids & Family'),
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/61NyTZaEAqL._SX357_BO1,204,203,200_.jpg'
    },
  },
  {
    page_count: 232,
    medium_attributes: {
      title: 'O Orfanato da Srta. Peregrine Para Crianças Peculiares',
      description: "O livro que deu origem ao filme de Tim Burton! Com estreia marcada para setembro deste ano, o trailer começou a circular nas redes sociais em 15 de março e, até agora, já teve mais de 2,5 milhões de visualizações.",
      price: 22.9,
      author: another_user,
      category: Category.find_by(name: 'Kids & Family'),
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/513JD1-nalL._SX343_BO1,204,203,200_.jpg'
    },
  },
  {
    page_count: 232,
    medium_attributes: {
      title: 'Razão e Sensibilidade. Orgulho e Preconceito. Persuasão',
      description: "O fascínio que os escritos de Jane Austen exercem, mais do que se manter, torna-se maior no curso do tempo.",
      price: 40.7,
      author: another_user,
      category: Category.find_by(name: 'Kids & Family'),
      file: 'https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.1084.epub',
      thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/51mA70WBLVL._SX326_BO1,204,203,200_.jpg'
    }
  },
])
