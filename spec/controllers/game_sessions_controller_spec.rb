require 'rails_helper'

RSpec.describe GameSessionsController, type: :controller do
  login_user

  let(:game_session) { create(:game_session) }
  let(:game) { create(:game) }
  let(:game_mode) { create(:game_mode) }

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
        post :create, game_session: attributes_for(:game_session, game_id: game.id, game_mode_id: game_mode.id)
      }.to change(GameSession, :count).by(1)
    end
    
    it 'fails to create a game session' do
      post :create, game_session: attributes_for(:game_session)
      expect(response).to render_template('new')
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

  # TODO: PATCH #update spec for game_session
  describe 'PATCH #update' do
    let(:valid_attributes) { {notes: 'Why did you blow up my castle?!'} }
    let(:invalid_attributes) { {notes: nil} }

    it 'successfully updates a game session' do
      @game_session = create(:game_session)
      patch :update, {id: @game_session.to_param, game_session: valid_attributes}
      @game_session.reload
      expect(response).to redirect_to(@game_session)
      expect(@game_session.notes).to eq('Why did you blow up my castle?!')
    end

    it 'fails to update a game session' do
      @game_session = create(:game_session)
      patch :update, {id: @game_session.to_param, game_session: invalid_attributes}
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a game session' do
      @game_session = create(:game_session)
      expect {
        delete :destroy, id: @game_session
      }.to change(GameSession, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end
  end
  
  describe 'POST #join_game' do
    it 'successfully joins a game session' do
      @game_session = create(:game_session)
      post :join_game, id: @game_session
      expect(response).to redirect_to(game_session_path)
      expect(@game_session.users).to include(subject.current_user)
    end
  end
end
