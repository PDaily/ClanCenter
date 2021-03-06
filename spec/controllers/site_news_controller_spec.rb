require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SiteNewsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SiteNews. As you add validations to SiteNews, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SiteNewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all site_news as @site_news" do
      site_news = SiteNews.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:site_news)).to eq([site_news])
    end
  end

  describe "GET #show" do
    it "assigns the requested site_news as @site_news" do
      site_news = SiteNews.create! valid_attributes
      get :show, {:id => site_news.to_param}, valid_session
      expect(assigns(:site_news)).to eq(site_news)
    end
  end

  describe "GET #new" do
    it "assigns a new site_news as @site_news" do
      get :new, {}, valid_session
      expect(assigns(:site_news)).to be_a_new(SiteNews)
    end
  end

  describe "GET #edit" do
    it "assigns the requested site_news as @site_news" do
      site_news = SiteNews.create! valid_attributes
      get :edit, {:id => site_news.to_param}, valid_session
      expect(assigns(:site_news)).to eq(site_news)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SiteNews" do
        expect {
          post :create, {:site_news => valid_attributes}, valid_session
        }.to change(SiteNews, :count).by(1)
      end

      it "assigns a newly created site_news as @site_news" do
        post :create, {:site_news => valid_attributes}, valid_session
        expect(assigns(:site_news)).to be_a(SiteNews)
        expect(assigns(:site_news)).to be_persisted
      end

      it "redirects to the created site_news" do
        post :create, {:site_news => valid_attributes}, valid_session
        expect(response).to redirect_to(SiteNews.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved site_news as @site_news" do
        post :create, {:site_news => invalid_attributes}, valid_session
        expect(assigns(:site_news)).to be_a_new(SiteNews)
      end

      it "re-renders the 'new' template" do
        post :create, {:site_news => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested site_news" do
        site_news = SiteNews.create! valid_attributes
        put :update, {:id => site_news.to_param, :site_news => new_attributes}, valid_session
        site_news.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested site_news as @site_news" do
        site_news = SiteNews.create! valid_attributes
        put :update, {:id => site_news.to_param, :site_news => valid_attributes}, valid_session
        expect(assigns(:site_news)).to eq(site_news)
      end

      it "redirects to the site_news" do
        site_news = SiteNews.create! valid_attributes
        put :update, {:id => site_news.to_param, :site_news => valid_attributes}, valid_session
        expect(response).to redirect_to(site_news)
      end
    end

    context "with invalid params" do
      it "assigns the site_news as @site_news" do
        site_news = SiteNews.create! valid_attributes
        put :update, {:id => site_news.to_param, :site_news => invalid_attributes}, valid_session
        expect(assigns(:site_news)).to eq(site_news)
      end

      it "re-renders the 'edit' template" do
        site_news = SiteNews.create! valid_attributes
        put :update, {:id => site_news.to_param, :site_news => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested site_news" do
      site_news = SiteNews.create! valid_attributes
      expect {
        delete :destroy, {:id => site_news.to_param}, valid_session
      }.to change(SiteNews, :count).by(-1)
    end

    it "redirects to the site_news list" do
      site_news = SiteNews.create! valid_attributes
      delete :destroy, {:id => site_news.to_param}, valid_session
      expect(response).to redirect_to(site_news_index_url)
    end
  end

end
