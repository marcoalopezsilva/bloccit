require 'rails_helper'

# 'type: :controller' tells RSpec to treat the test as a controller test.
# This allows us to simulate controller actions such as HTTP requests.
RSpec.describe PostsController, type: :controller do

#NL: Creates a post and assigns it to my_post using let
  let (:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      # the test performs a GET on the index view and expects the response to be successful.
      get :index
      # 'have_http_status(:success)' checks for a response code of 200, which is the standard HTTP response code for success
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
        get :index
        # 'assigns' gives the test access to "instance variables assigned in the action that are available for the view"
        expect(assigns(:posts)).to eq([my_post])
    end

  end

#  describe "GET #show" do
#    it "returns http success" do
#      get :show
#      expect(response).to have_http_status(:success)
#    end
#  end

#  describe "GET #new" do
#    it "returns http success" do
#      get :new
#      expect(response).to have_http_status(:success)
#    end
# end

#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

end
