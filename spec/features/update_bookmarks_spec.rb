feature 'Update existing bookmark' do
    scenario 'A user is able to update a bookmark in the list' do
      Bookmark.add('http://www.makersacademy.com', "Makers")
      Bookmark.add('http://www.google.com', "Google")
      visit '/bookmarks'
      click_button('Update Bookmark')
      click_button('Update Makers')
      expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    end
  end