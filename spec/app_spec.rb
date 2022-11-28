require_relative '../app.rb'

RSpec.describe Application do

    it 'gets albums' do

        io = double :io
        expect(io).to receive(:puts).with("Welcome to the music library manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all albums")
        expect(io).to receive(:puts).with("2 - List all artists")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with('* 1 - song1')
        expect(io).to receive(:puts).with('* 2 - song2')

    end

end