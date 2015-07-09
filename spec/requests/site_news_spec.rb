require 'rails_helper'

RSpec.describe "SiteNews", type: :request do
  describe "GET /site_news" do
    it "works! (now write some real specs)" do
      get site_news_index_path
      expect(response).to have_http_status(200)
    end
  end
end
