require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  
  feature 'Visit' do
    
    # ユーザー登録ページ
    it 'Signup page' do
      visit new_signup_path
  
      expect(page).to have_text('ユーザー登録')
    end
  end
  
  feature 'Controll' do
    
    # 新規ユーザーの作成に成功
    it 'Creates new user' do
      visit new_signup_path
      fill_in 'user_name', with: '大西'
      fill_in 'user_email', with: 'piyopiyo@example.com'
      fill_in 'user_password', with: '12341234'
      fill_in 'user_password_confirmation', with: '12341234'
      
      expect do
        click_on '登録する'
        
        expect(page).to have_http_status :ok
        expect(current_path).to eq login_path
        expect(page).to have_text '登録されたメールアドレス宛に確認用のメールを送信しました'
      end.to change(User, :count).by 1
      
      created_user = User.last
      expect(created_user.name).to eq '大西'
      expect(created_user.email).to eq 'piyopiyo@example.com'
      
      # 作成直後でメールアクティベーションが済んでいないため、パスワード関連の項目はnilになるはず
      expect(created_user.password).to eq nil
      expect(created_user.password_confirmation).to eq nil
    end
    
    # 新規ユーザーの作成に失敗（未記入の項目があるため）
    it 'Creates new user with missing fields' do
      visit new_signup_path
      
      fill_in 'user_name', with: '大西'
      fill_in 'user_email', with: 'piyopiyo@example.com'
      fill_in 'user_password', with: '12341234'
      
      expect do
        click_on '登録する'
        
        expect(page).to have_http_status :ok
        expect(current_path).to eq signup_index_path
      end.to change(User, :count).by 0
    end
  end
end