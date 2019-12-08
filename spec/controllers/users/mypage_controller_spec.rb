require 'rails_helper'

RSpec.describe Users::MypageController, type: :controller do
  
  let(:user) { create(:user) }
  
  before do
    login_user(user)
  end
  
  describe 'GET #reviews' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :reviews
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET #bookmarks' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :reviews
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET #events' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :reviews
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET #profile' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET #email' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :email
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET #password' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :password
      expect(response).to have_http_status(:success)
    end
  end
end