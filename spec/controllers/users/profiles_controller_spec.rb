require 'rails_helper'

RSpec.describe Users::ProfilesController, type: :controller do
  
  let(:user) { create(:user) }
  
  before do
    login_user(user)
  end
  
  describe 'Patch #update' do
    
    # プロフィールを更新できる
    it 'updates user profile' do
      user_params = FactoryBot.attributes_for(:user, profile: '26歳会社員です。転職のために頑張ります。')
      patch :update, params: { id: user.id, user: user_params }
      expect(user.reload.profile).to eq '26歳会社員です。転職のために頑張ります。'
    end
  end
end