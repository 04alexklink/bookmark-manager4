# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'
require './spec/web_helper'
require 'pg'

# the bookmark manager class
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    p "hello app.rb"
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :bookmarksnew
  end

  post '/bookmarks' do
    Bookmark.add(params['url'], params['title'])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
