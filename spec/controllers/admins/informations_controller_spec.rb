require 'rails_helper'

RSpec.describe Admins::InformationsController, type: :controller do
  
  let(:user) { create(:admin) }
  let(:information) { create(:information) }
  
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

  describe "GET #new" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :edit, params: { id: information.id}
      expect(response).to have_http_status(:success)
    end
  end
end