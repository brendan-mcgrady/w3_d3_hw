require_relative('../db/sql_runner')

class Album
  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i()
    @artist_id = options['artist_id'].to_i()
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = 'INSERT INTO albums (artist_id, title, genre) VALUES ($1, $2, $3) RETURNING id;'
    values = [@artist_id, @title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result [0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM albums;'
    albums = SqlRunner.run(sql)
    return albums.map{ |album| Album.new(album) }
  end

  def self.delete_all()
    sql = 'DELETE FROM albums;'
    SqlRunner.run(sql)
  end

  def artist()
    sql = 'SELECT * FROM artists WHERE id = $1;'
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)[0]
    return Artist.new(artist)
  end

end
