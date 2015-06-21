require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  let(:user) { create(:user) }

  it 'should have a current_user' do
    expect(subject.current_user).not_to be_nil
  end

  describe 'factory' do
    it 'should have a email' do
      expect(user.email).not_to be_nil
    end

    it 'should have a user_name' do
      expect(user.user_name).not_to be_nil
    end

    it 'should have a xbox_name' do
      expect(user.xbox_name).not_to be_nil
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
    it 'successfully creates a user' do
      expect {
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(user_url(id: assigns(:user).id))
    end
  end

  describe 'GET #show' do
    it 'successfully shows a user' do
      get :show, id: user
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'successfully edits a user' do
      get :edit, id: user
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  # TODO: PATCH #update spec for users
  describe 'PATCH #update' do
    let(:valid_attributes) { {xbox_name: 'prettydecentdude'} }
    let(:invalid_attributes) { {email: nil} }

    it 'successfully updates a user' do
      @user = create(:user)
      patch :update, {id: @user.to_param, user: valid_attributes}
      @user.reload
      expect(response).to have_http_status(200)
      expect(@user.xbox_name).to eq('prettydecentdude')
    end

    it 'fails to update a user' do
      @user = create(:user)
      patch :update, {id: @user.to_param, user: invalid_attributes}
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a user' do
      @user = create(:user)
      expect {
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
