require 'rails_helper'

RSpec.describe Users::HomeController, type: :controller do
  
  describe 'GET #index' do
    
    # 正常なレスポンスを返す
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end