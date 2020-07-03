# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'Visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user is able to view bookmarks' do
    Bookmark.add('http://www.makersacademy.com', "Makers")
    Bookmark.add('http://www.google.com', "Google")
    
    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
