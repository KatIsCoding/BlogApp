require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get users' do
    get pages_users_url
    assert_response :success
  end
end
