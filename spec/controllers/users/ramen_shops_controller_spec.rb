require 'rails_helper'

RSpec.describe  Users::RamenShopsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:ramen_shop) { create(:ramen_shop) }
  
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

  describe "GET #show" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :show, params: { id: ramen_shop.id}
      expect(response).to have_http_status(:success)
    end
  end
end
