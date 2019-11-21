require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i()
    @album_id = options['album_id'].to_i()
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO artists (album_id, name) VALUES ($1, $2) RETURNING id;'
    values = [@album_id, @name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM artists;'
    artists = SqlRunner.run(sql)
    return artists.map{ |artist| Artist.new(artist) }
  end

  def self.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

  def album()
    sql = 'SELECT * FROM albums WHERE id = $1;'
    values = [@album_id]
    album = SqlRunner.run(sql, values)[0]
    return Album.new(album)
  end

end
