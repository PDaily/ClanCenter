require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  login_user

  let(:game) { create(:game) }

  describe 'factory' do
    it "should have a title" do
      expect(game.title).not_to be_nil
    end

    it "should have a description" do
      expect(game.description).not_to be_nil
    end
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'successfully creates a game' do
      expect {
        post :create, game: attributes_for(:game)
      }.to change(Game, :count).by(1)
    end
  end

  describe 'GET #show' do
    it 'successfully shows a game' do
      get :show, id: game
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'successfully edits a game' do
      get :edit, id: game
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  # TODO: PATCH #update spec
  describe 'PATCH #update' do
    it 'successfully updates a game' do

    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a game' do
      @game = create(:game)
      expect{
         delete :destroy, id: @game
       }.to change(Game, :count).by(-1)

       expect(response).to redirect_to(games_path)
    end
  end

end
