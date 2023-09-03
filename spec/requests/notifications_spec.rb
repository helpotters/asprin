require "rails_helper"

RSpec.xdescribe "Notifications", type: :request do
  describe "GET /destroy" do
    it "returns http success" do
      get "/notifications/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/notifications/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/notifications/update"
      expect(response).to have_http_status(:success)
    end
  end
end
