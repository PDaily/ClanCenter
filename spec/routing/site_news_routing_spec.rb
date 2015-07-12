require "rails_helper"

RSpec.describe SiteNewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news").to route_to("site_news#index")
    end

    it "routes to #new" do
      expect(:get => "/news/new").to route_to("site_news#new")
    end

    it "routes to #show" do
      expect(:get => "/news/1").to route_to("site_news#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news/1/edit").to route_to("site_news#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news").to route_to("site_news#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/news/1").to route_to("site_news#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/news/1").to route_to("site_news#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news/1").to route_to("site_news#destroy", :id => "1")
    end

  end
end
