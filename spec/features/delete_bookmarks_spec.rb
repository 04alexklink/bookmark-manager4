feature 'Delete bookmark' do
  scenario 'A user is able delete a bookmark from the list' do
    Bookmark.add('http://www.makersacademy.com', "Makers")
    Bookmark.add('http://www.google.com', "Google")
    visit '/bookmarks'
    click_button('Delete Bookmark')
    # visit '/bookmarks/delete'
    click_button('Delete Makers')
    #visit /bookmarks
    expect(page).not_to have_content('Makers')
  end

  scenario 'A user is able delete a selected bookmark from the list' do
    Bookmark.add('http://www.makersacademy.com', "Makers")
    Bookmark.add('http://www.google.com', "Google")
    visit '/bookmarks'
    click_button('Delete Bookmark')
    # visit '/bookmarks/delete'
    click_button('Delete Google')
    #visit /bookmarks
    expect(page).not_to have_content('Google')
  end
end