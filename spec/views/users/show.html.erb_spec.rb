require 'rails_helper'

RSpec.describe 'Testing User Show Page', type: :feature do

  before(:each) do
    visit '/'
    #Users Creation
    first_user = User.new(:name => 'Tom', :photo => 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', :bio => 'Teacher from Mexico.',:email => 'firstUser@example.com', :password => 'password', :password_confirmation => 'password')
    second_user = User.new(:name => 'Lilly', :photo => 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', :bio => 'Teacher from Mexico.',:email => 'secondUser@example.com', :password => 'passtest231564', :password_confirmation => 'passtest231564', :role => 'admin')
    first_user.skip_confirmation!
    second_user.skip_confirmation!
    @first_user = first_user
    first_user.save
    second_user.save
    # User Session Creation
    x = User.new(name: 'username', email: 'example@example.com', password: 'password', postscounter: 1)
    x.skip_confirmation!
    x.save
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'    
    # Login
    click_button 'Log in'
    click_link 'Tom'
    #Creation of 3 posts for first users
    first_post = Post.create(author: first_user, title: 'One', text: 'This is my first post', commentscounter: 0, likescounter: 0)
    @first_post = first_post
    second_post = Post.create(author: first_user, title: 'Two', text: 'This is my second post', commentscounter: 0, likescounter: 0)
    third_post = Post.create(author: first_user, title: 'Three', text: 'This is my first post', commentscounter: 0, likescounter: 0)
  end

  scenario 'The users photo is visible' do
    expect(page).to have_selector('img')
  end

  scenario 'The users username is visible' do
    expect(page).to have_content 'Tom'
  end

  scenario 'The users number of posts is visible' do
    expect(page).to have_content 'Number of posts:'
  end

  scenario 'The users bio is visible' do
    expect(page).to have_content 'Teacher from Mexico.'
  end

  scenario 'The users first 3 posts are visible' do
    expect(page).to have_selector '.posts-container'
    sleep(1)
    #first_post = Post.create(author: @first_user, title: 'One', text: 'This is my first post', commentscounter: 0, likescounter: 0)
    #
    #second_post = Post.create(author: @first_user, title: 'Two', text: 'This is my second post', commentscounter: 0, likescounter: 0)
    #third_post = Post.create(author: @first_user, title: 'Three', text: 'This is my first post', commentscounter: 0, likescounter: 0)
    expect(page).to have_content 'One'
    expect(page).to have_content 'Two'
    expect(page).to have_content 'Three'
  end

  scenario 'The button to see more posts is visible' do
    expect(page).to have_content 'View All Posts'
  end

  scenario 'When clicking in a user post, the page redirects to that post page' do
    click_button 'View All Posts'
    click_link 'One'
    sleep(2)
    expect(page.current_path).to eq '/users/' + @first_user.id.to_s + '/posts/' + @first_post.id.to_s
  end

  scenario 'When clicking in the button to see all posts, the page redirects to that post page' do
    sleep(1)
    expect(page.current_path).to eq '/users/' + @first_user.id.to_s
  end

end
