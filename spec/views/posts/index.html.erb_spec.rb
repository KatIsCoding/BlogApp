require 'rails_helper'

RSpec.describe 'Testing Posts Index Page', type: :feature do
  before(:each) do
    visit '/'
    
    # User Session Creation
    x = User.new(name: 'username', email: 'example@example.com', password: 'password', postscounter: 1)
    x.skip_confirmation!
    x.save
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'    
    #Users Creation
    first_user = User.new(:name => 'Tom', :photo => 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', :bio => 'Teacher from Mexico.',:email => 'firstUser@example.com', :password => 'password', :password_confirmation => 'password')
    second_user = User.new(:name => 'Lilly', :photo => 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', :bio => 'Teacher from Mexico.',:email => 'secondUser@example.com', :password => 'passtest231564', :password_confirmation => 'passtest231564', :role => 'admin')
    first_user.skip_confirmation!
    second_user.skip_confirmation!
    @first_user = first_user
    first_user.save
    second_user.save
    #Creation of 3 posts for first users
    first_post = Post.create(author: first_user, title: 'One', text: 'This is my first post', commentscounter: 0, likescounter: 0)
    @first_post = first_post
    second_post = Post.create(author: first_user, title: 'Two', text: 'This is my second post', commentscounter: 0, likescounter: 0)
    third_post = Post.create(author: first_user, title: 'Three', text: 'This is my first post', commentscounter: 0, likescounter: 0)
    # Creation of a comment
    Comment.create(author: first_user, post: first_post, text: 'This is my first comment')
    # Login
    click_button 'Log in'
    click_link 'Tom'

    click_button 'View All Posts'
  end

  scenario 'The users image is visible' do
    sleep(2)
    expect(page).to have_selector('img')
  end

  scenario 'The users username is visible' do
    expect(page).to have_content 'Tom'
  end

  scenario 'The users number of posts is visible' do
    expect(page).to have_content 'Number of posts: 3'
  end

  scenario 'The posts title is visible' do
    expect(page).to have_content 'One'
  end

  scenario 'The posts text is visible' do
    expect(page).to have_content 'This is my first post'
  end

  scenario 'The first comments in the post are visible' do
    expect(page).to have_content 'This is my first comment'
  end

  scenario 'The number of comments in the post is visible' do
    expect(page).to have_content 'Comments: 1'
  end

  scenario 'The number of likes in the post is visible' do
    expect(page).to have_content 'Likes: 0'
  end

  scenario 'When clicking on a post, the page redirects to that post page' do
    sleep(5)
    click_link 'One'
    expect(page.current_path).to eq '/users/' + @first_user.id.to_s + '/posts/' + @first_post.id.to_s
  end



  

end
