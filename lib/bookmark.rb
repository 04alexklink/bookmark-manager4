# frozen_string_literal: true

# the bookmark class
class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, url, title)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    set_environment
    result = @connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.add(url, title)
    set_environment
    @connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
  end
end
