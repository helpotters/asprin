require "rails_helper"

RSpec.xdescribe "Searches", type: :request do
  describe "GET /suggestions" do
    it "returns http success" do
      get "/search/suggestions"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/search/index"
      expect(response).to have_http_status(:success)
    end
  end
end
