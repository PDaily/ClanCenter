require 'rails_helper'

RSpec.describe GameSessionsController, type: :controller do
  login_user

  let(:game_session) { create(:game_session) }
  let(:game) { create(:game) }
  let(:game_mode) { create(:game_mode) }

  describe 'Factory' do
    context 'game_session.game' do
      it 'correctly has a title assigned to it' do
        expect(game_session.game.title).not_to be_nil
        expect(game_session.game.title).to eq('Minecraft')
      end
    end

    context 'game_session.game_mode' do
      it 'correctly has a title assigned to it' do
        expect(game_session.game_mode.title).not_to be_nil
        expect(game_session.game_mode.title).to eq('Survival')
      end
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
      @game = game
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'successfully creates a game_session' do
      expect {
        post :create, game_session: attributes_for(:game_session)
      }.to change(GameSession, :count).by(1)
    end
  end

  describe 'GET #show' do
    it 'successfully shows a game session' do
      get :show, id: game_session
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'successfully edits a game session' do
      get :edit, id: game_session
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  # TODO: PATCH #update spec
  describe 'PATCH #update' do
    it 'successfully updates a game session' do

    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a game session' do
      @game_session = create(:game_session)
      expect{
         delete :destroy, id: @game_session
       }.to change(GameSession, :count).by(-1)

       expect(response).to redirect_to(game_sessions_path)
    end
  end

end
