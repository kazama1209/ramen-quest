require 'rails_helper'

RSpec.describe Admins::UsersController, type: :controller do
  
  let(:user) { create(:admin) }
  
  before do
    login_user(user)
  end
  
  describe 'GET #index' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'Get #new' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'Get #edit' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :edit, params: { id: user.id}
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'Patch #update' do
    
    # ユーザー情報を変更できる
    it 'updates user profile' do
      user_params = FactoryBot.attributes_for(:user, name: '田中')
      patch :update, params: { id: user.id, user: user_params }
      expect(user.reload.name).to eq '田中'
    end
  end
end