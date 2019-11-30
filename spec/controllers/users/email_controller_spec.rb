require 'rails_helper'

RSpec.describe Users::EmailController, type: :controller do
  
  let(:user) { create(:user) }
  
  before do
    login_user(user)
  end
  
  describe 'Patch #update' do
    
    # メールアドレスを変更できる
    it 'updates email' do
      email_params = FactoryBot.attributes_for(:user, email: 'hogehoge@example.com', email_confirmation: 'hogehoge@example.com')
      patch :update, params: { id: user.id, user: email_params }
      expect(user.reload.email).to eq 'hogehoge@example.com'
    end
  end
end