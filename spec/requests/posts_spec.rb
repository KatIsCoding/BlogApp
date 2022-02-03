require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "get base page" do
      get '/users/45/posts'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include("45")
    end

    it "get a specific blog of an user" do
      get '/users/1337/posts/7331'
      expect(response).to have_http_status(200)
      expect(response.body).to include("1337")
      expect(response.body).to include("7331")
    end
  end
end
