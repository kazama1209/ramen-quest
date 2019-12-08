require 'rails_helper'

RSpec.feature "Login", type: :feature do
  
  feature 'Visit' do
    
    # ログインページ
    it 'Login page' do
      visit login_path
  
      expect(page).to have_text('メールアドレス')
      expect(page).to have_text('パスワード')
    end
  end
  
  feature 'Controll' do
    
    # ログイン成功
    it 'Login successfully' do
      create(:user)
      visit login_path
      fill_in 'メールアドレス', with: 'user@example.com'
      fill_in 'パスワード', with: '12341234'
      
      click_on 'ログインする'
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq dashboard_index_path
      expect(page).to have_text 'ログインに成功しました'
    end
  end
end