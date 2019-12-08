require 'rails_helper'

RSpec.feature 'Password Update', type: :feature do
  
  let(:user) { create(:user) }
  
  feature 'Visit' do
    
    # ユーザーとしてのログイン後（アクセス可能）
    it 'After login' do
      login(user)
      visit mypage_password_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_password_path
      expect(page).to have_text 'パスワードの変更'
    end
    
    # ユーザーとしてのログイン後（アクセス不可）
    it 'Before login' do
      visit mypage_password_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq login_path
      expect(page).to have_text 'ログインが必要です'
    end
  end
  
  feature 'Controll' do
    before(:each) do
      login(user)
      visit mypage_password_path
      fill_in 'user_current_password', match: :first, with: '12341234'
      fill_in 'user_password', with: '43214321'
      fill_in 'user_password_confirmation', with: '43214321'
    end
    
    # パスワードの更新に成功
    it 'Updates successfully' do
      click_on '更新する'

      updated_user = User.find(user.id)

      expect(updated_user.valid_password?('43214321')).to eq true
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_password_path
      expect(page).to have_text 'パスワードを更新しました'
    end
    
    # パスワードの更新に失敗（入力された現在のパスワードが異なるため）
    it 'Fails in update (with different current password)' do
      fill_in 'user_current_password', with: '11111111'
      click_on '更新する'
      
      updated_user = User.find(user.id)

      expect(updated_user.valid_password?('43214321')).to eq false
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_password_path
      expect(page).to have_text '現在のパスワードと一致しません'
    end
  end
end