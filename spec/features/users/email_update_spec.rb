require 'rails_helper'

RSpec.feature "Email Update", type: :feature do
  
  let(:user) { create(:user) }
  
  feature 'Visit' do
    
    # ユーザーとしてのログイン後（アクセス可能）
    it 'After login' do
      login(user)
      visit mypage_email_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_email_path
      expect(page).to have_text 'メールアドレスの変更'
    end
    
    # ユーザーとしてのログイン後（アクセス不可）
    it 'Before login' do
      visit mypage_email_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq login_path
      expect(page).to have_text 'ログインが必要です'
    end
  end
  
  feature 'Controll' do
    before(:each) do
      login(user)
      visit mypage_email_path
      fill_in 'user_email', match: :first, with: 'hogehoge@example.com'
      fill_in 'user_email_confirmation', with: 'hogehoge@example.com'
    end
    
    # メールアドレスの変更に成功
    it 'Updates successfully ' do
      click_on '更新する'
      
      updated_user = User.find(user.id)
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq dashboard_index_path
      expect(updated_user.email).to eq 'hogehoge@example.com'
      expect(page).to have_text 'メールアドレスを変更しました'
    end
    
    # メールアドレスの変更に失敗（有効な形式のメールアドレスが入力されなかったため）
    it 'Fails in update (with wrong format email)' do
      fill_in 'user_email', match: :first, with: 'hogehogehogehoge'
      fill_in 'user_email_confirmation', with: 'hogehogehogehoge'
      click_on '更新する'
      
      updated_user = User.find(user.id)
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq dashboard_index_path
      expect(updated_user.email).to eq 'user@example.com'
    end
    
    # メールアドレスの変更に失敗（入力されたメールアドレスと確認用メールアドレスが一致しなかったため）
    it 'Fails in update (emails are not the same)' do
      fill_in 'user_email', match: :first, with: 'foobar@example.com'
      click_on '更新する'
      
      updated_user = User.find(user.id)
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_email_path
      expect(updated_user.email).to eq 'user@example.com'
      expect(page).to have_text '確認用メールアドレスと一致しません'
    end
  end
end