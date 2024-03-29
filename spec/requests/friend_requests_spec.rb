require "rails_helper"

RSpec.xdescribe "FriendRequests", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/friend_requests/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/friend_requests/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/friend_requests/update"
      expect(response).to have_http_status(:success)
    end
  end
end
