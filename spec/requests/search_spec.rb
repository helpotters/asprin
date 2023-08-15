require 'rails_helper'

RSpec.describe "Searches", type: :request do
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
