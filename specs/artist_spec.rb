require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/artist')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ArtistTest < MiniTest::Test

  def test_can_create_new_artist
    artist_name = {
      'name' => 'JID'
    }

    new_artist = Artist.new(artist_name)
    assert_equal('JID', new_artist.name())
  end

end
