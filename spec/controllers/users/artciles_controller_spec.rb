require 'rails_helper'

RSpec.describe Users::ArticlesController, type: :controller do
  
  let(:user) { create(:admin) }
  let(:article) { create(:article) }
  
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
      get :show, params: { id: article.id}
      expect(response).to have_http_status(:success)
    end
  end
end