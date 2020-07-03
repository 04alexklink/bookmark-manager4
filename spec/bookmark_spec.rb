# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.add('http://www.makersacademy.com', 'MakersAcademy') 
      Bookmark.add('http://www.google.com', 'Google')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 2
      expect(bookmarks.first.id).to eq Bookmark.all.first.id
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
      expect(bookmarks.first.title).to eq 'MakersAcademy'
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      Bookmark.add('http://www.makers.com', "Makers")
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq('http://www.makers.com')
      expect(bookmarks.first.title).to eq("Makers")
    end
  end
end
