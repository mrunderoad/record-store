require 'album'
require 'rspec'

describe '#Album' do
  before(:each) do
    Album.clear
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, "jazz", 1900, "john coltrane")
      album.save
      album2 = Album.new("Blue", nil, "jazz", 1900, "john coltrane")
      album2.save
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil, "jazz", 1900, "john coltrane")
      album2 = Album.new("Blue", nil, "jazz", 1900, "john coltrane")
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, "jazz", 1900, "john coltrane")
      album.save
      album2 = Album.new("Blue", nil, "jazz", 1900, "john coltrane")
      album2.save
      Album.clear
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, "jazz", 1900, "john coltrane")
      album.save()
      album2 = Album.new("Blue", nil, "jazz", 1900, "john coltrane")
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, "jazz", 1900, "john coltrane")
      album.save()
      album.update("A Love Supreme", '', '', '')
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, "jazz", 1900, "john coltrane")
      album.save()
      album2 = Album.new("Blue", nil, "jazz", 1900, "john coltrane")
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#album_search') do
    it('finds an album either by name, genre, year and artist') do
      album = Album.new("Giant Steps", nil, "jazz", 1900, "john coltrane")
      expect(album.search("jazz")).to(eq(true))
    end
  end
end