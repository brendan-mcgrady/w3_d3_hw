require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new(
  {
    'name' => 'JID',
    'album_id' => album3.id()
  }
)

artist1.save()

artist2 = Artist.new(
  {
    'name' => 'J Cole',
    'album_id' => album2.id()
  }
)

artist2.save()

artist3 = Artist.new(
  {
    'name' => 'Kendrick Lamar',
    'album_id' => album1.id()
  }
)

artist3.save()

album1 = Album.new(
  {
    'title' => 'KOD',
    'genre' => 'Hiphop',
    'artist_id' => artist2.id()
  }
)

album1.save()

album2 = Album.new(
  {
    'title' => 'DAMN.',
    'genre' => 'Hiphop',
    'artist_id' => artist3.id()
  }
)

album2.save()

album3 = Album.new(
  {
    'title' => 'The Never Story',
    'genre' => 'Hiphop',
    'artist_id' => artist1.id()
  }
)

album3.save()

binding.pry
nil
