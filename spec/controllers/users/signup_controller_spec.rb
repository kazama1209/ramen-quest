require 'rails_helper'

RSpec.describe Users::SignupController, type: :controller do
  
  let(:user) { create(:user) }
  
  describe 'GET #new' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
