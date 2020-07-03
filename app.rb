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
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :bookmarksnew
  end

  post '/bookmarks' do
    Bookmark.add(params['url'], params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb :bookmarksdelete
  end

  post '/bookmarks/delete' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    @bookmarks = Bookmark.all
    erb :bookmarksupdate
  end

  post '/bookmarks/update' do
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
