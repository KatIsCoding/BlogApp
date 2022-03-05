require 'rails_helper'

RSpec.describe 'Testing User Index Page', type: :feature do
  before(:each) do
    visit '/'
    first_user = User.new(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1',
                          bio: 'Teacher from Mexico.', email: 'firstUser@example.com', password: 'password',
                          password_confirmation: 'password')
    second_user = User.new(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1',
                           bio: 'Teacher from Mexico.', email: 'secondUser@example.com', password: 'passtest231564',
                           password_confirmation: 'passtest231564', role: 'admin')
    first_user.skip_confirmation!
    second_user.skip_confirmation!
    @first_user = first_user
    first_user.save
    second_user.save
    x = User.new(name: 'username', email: 'example@example.com', password: 'password', postscounter: 1)
    x.skip_confirmation!
    x.save
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'Other users username are shown' do
    expect(page).to have_content 'Tom'
    expect(page).to have_content 'Lilly'
  end

  scenario 'Other users images are shown' do
    expect(page).to have_selector('img')
  end

  scenario 'Number of posts for each user are shown' do
    expect(page).to have_content 'Number of posts: 0'
    expect(page).to have_content 'Number of posts: 0'
    expect(page).to have_content 'Number of posts: 1'
  end

  scenario 'When clicking on a user, the page redirects to that user page' do
    click_link 'Tom'

    expect(page.current_path).to eq "/users/#{@first_user.id}"
  end
end
