require 'rails_helper'

RSpec.describe 'Testing Login Page', type: :feature do

  before(:each) do
    visit '/'
  end
  scenario 'Should have email, password and submit inputs' do
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(all('input').count).to eq 4
  end

  scenario 'When not using credentials, an error is shown' do
    click_button 'Log in'
    expect(page).to have_content 'Forgot your password?'
  end

  scenario 'When using incorrect credentials, an error is shown' do
    fill_in 'Email', with: 'asd@asd.com'
    fill_in 'Password', with: 'asd'    
    click_button 'Log in'
    expect(page).to have_content 'Forgot your password?'
  end

  scenario 'When using correct credentials, I get redirected to root page' do
    x = User.new(name: 'username', email: 'firstUser@example.com', password: 'password', postscounter: 1)
    x.skip_confirmation!
    x.save
    fill_in 'Email', with: 'firstUser@example.com'
    fill_in 'Password', with: 'password'    
    click_button 'Log in'
    expect(page).to have_content 'Create a post here!'
  end
end
