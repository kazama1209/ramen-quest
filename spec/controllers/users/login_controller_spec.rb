require 'rails_helper'

RSpec.describe Users::LoginController, type: :controller do
  
  let(:user) { create(:user) }
  
  describe 'GET #new' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'Post #create' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      user_params = FactoryBot.attributes_for(:user)
      post :create, params: { user: user_params }
      expect(response).to have_http_status(:success)
    end
  end
end