require 'rails_helper'

RSpec.feature 'Profile Update', type: :feature do
  
  let(:user) { create(:user) }
  
  feature 'Visit' do
    
    # ユーザーとしてのログイン後（アクセス可能）
    it 'After login' do
      login(user)
      visit mypage_profile_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_profile_path
      expect(page).to have_text 'プロフィールの変更'
    end
    
    # ユーザーとしてのログイン後（アクセス不可）
    it 'Before login' do
      visit mypage_profile_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq login_path
      expect(page).to have_text 'ログインが必要です'
    end
  end
  
  feature 'Controll' do
    
    # プロフィールの更新に成功
    it 'Updates successfully ' do
      login(user)
      visit mypage_profile_path
      fill_in 'user_name', with: '鈴木'
      fill_in 'user_profile', with: '良い出会いを探しています。よろしくお願いします。'
      find_by_id('user_image').click
      attach_file('user[image]', 'spec/fixtures/test.jpg')
    
      click_on '更新する'
      
      updated_user = User.find(user.id)
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq dashboard_index_path
      expect(updated_user.name).to eq '鈴木'
      expect(updated_user.profile).to eq '良い出会いを探しています。よろしくお願いします。'
      expect(page).to have_text 'プロフィールを変更しました'
    end
  end
end