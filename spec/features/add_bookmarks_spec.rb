# frozen_string_literal: true

feature 'Add new bookmarks' do
  scenario 'A user is able add bookmarks to the list' do
    visit '/bookmarks/new'
    fill_in('url', with: 'www.ihatepsql.com')
    fill_in('title', with: 'learningpsql')
    click_button('Add bookmark')
    expect(page).to have_link('learningpsql', href: 'www.ihatepsql.com')
  end
end
