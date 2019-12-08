require 'rails_helper'

RSpec.describe Admins::InquiriesController, type: :controller do
  
  let(:user) { create(:admin) }
  
  before do
    login_user(user)
  end
  
  describe "GET #index" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end