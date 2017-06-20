# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create(username: 'tang')
user2 = User.create(username: 'joey')
user3 = User.create(username: 'howard')
user4 = User.create(username: 'casey')

artwork1 = Artwork.create(title: 'paint me like a french girl',
  image_url: 'titanic.com', artist_id: user3.id)
artwork2 = Artwork.create(title: 'mona lisa',
  image_url: 'awkwardsmile.com', artist_id: user1.id)
artwork3 = Artwork.create(title: 'passing specs',
  image_url: 'ninetypercentispassing.com', artist_id: user2.id)
artwork4 = Artwork.create(title: 'tang for life',
  image_url: 'imsocool.com', artist_id: user1.id)

artworkshare1 = ArtworkShare.create(artwork_id: artwork1.id,
  viewer_id: user4.id)
artworkshare2 = ArtworkShare.create(artwork_id: artwork1.id,
  viewer_id: user2.id)
artworkshare3 = ArtworkShare.create(artwork_id: artwork2.id,
  viewer_id: user3.id)
artworkshare4 = ArtworkShare.create(artwork_id: artwork4.id,
  viewer_id: user3.id)
