require 'album_repository'
require 'album'

RSpec.describe AlbumRepository do

        # clears test database table
        def reset_albums_table
            seed_sql = File.read('spec/seeds_albums.sql')
            connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
            connection.exec(seed_sql)
        end
    
          # runs clear on each test try
        before(:each) do
            reset_albums_table
        end

    it 'returns all albums' do
        repo = AlbumRepository.new

        album = repo.all
        expect(album.first['title']).to eq 'song1' 
        expect(album.first['release_year']).to eq '2022' 
        expect(album.first['artist_id']).to eq '1' 
    end

    it 'finds one album object by id' do

        repo = AlbumRepository.new

        found = repo.find(1)
        expect(found.first['title']).to eq 'song1' 
        expect(found.first['release_year']).to eq '2022' 
        expect(found.first['artist_id']).to eq '1' 
    end

    it '' do
        repository = AlbumRepository.new

        album = Album.new
        album.title = 'Trompe le Monde'
        album.release_year = 1991
        album.artist_id = 1

        repository.create(album)

        all_albums = repository.all
        expect(all_albums[2]['title']).to eq 'Trompe le Monde'
    end
    
end