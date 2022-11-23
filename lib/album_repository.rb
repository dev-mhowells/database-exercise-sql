require 'album'

class AlbumRepository

    def all

        albums = []

        sql = 'SELECT id, title, release_year, artist_id FROM albums'
        result_set = DatabaseConnection.exec_params(sql, [])


        result_set.each do |album|
            music = Album.new

            music.id = album['id']
            music.title = album['title']
            music.release_year = album['release_year']
            music.artist_id = album['artist_id']

            albums << album
        end

        return albums
    end

    def find(id)
        sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;'

        params = [id]

        result = DatabaseConnection.exec_params(sql, params)
        p result
        return result
    end
  
  end