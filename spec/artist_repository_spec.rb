require 'artist_repository'

RSpec.describe ArtistRepository do

    # clears test database table
    def reset_students_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

      # runs clear on each test try
    before(:each) do
        reset_students_table
    end

    it '' do

        repo = ArtistRepository.new

        artists = repo.all
        expect(artists.length).to eq 2
        expect(artists.first.id).to eq '1'
        expect(artists.first.name).to eq 'Pixies'
        
    end

end

