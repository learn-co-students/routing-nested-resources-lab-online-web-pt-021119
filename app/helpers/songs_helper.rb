module SongsHelper
  def display_song(song)
    song.artist.nil? ? link_to(song.title, song_path(song)) : link_to(song.title, artist_song_path(song.artist, song))
  end
end
