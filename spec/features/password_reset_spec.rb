require 'rails_helper'

RSpec.feature "Password Reset", type: :feature do
  
  feature 'Visit' do
    
    # パスワードリセットページ
    it 'Password reset page' do
      visit login_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq login_path
      
      click_on 'パスワードを忘れた方はこちら'
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq new_password_path
      expect(page).to have_text('パスワード再設定')
    end
  end
  
  feature 'Password reset mail' do
    
    before(:each) do
      create(:user)
      visit new_password_path
    end
    
    # パスワード再設定手続きのメール送信に成功
    it 'Sends password reset mail (valid email)' do
      fill_in 'email', with: 'user@example.com'
      
      expect do
        click_on '送信する'
      end.to change(ActionMailer::Base.deliveries, :size).by 1
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq login_path
      expect(page).to have_text('パスワード再設定用のメールを送信しました')
    end
    
    # パスワード再設定手続きのメール送信に失敗（存在しないメールアドレスが入力されたため）
    it 'Doesnt send password reset mail (invalid email)' do
      fill_in 'email', with: 'hogehoge@example.com'
      
      expect do
        click_on '送信する'
      end.to change(ActionMailer::Base.deliveries, :size).by 0

      expect(page).to have_http_status :ok
      expect(page).to have_text('メールアドレスが正しくありません')
    end
  end
  
  feature 'Password reset request form' do
    before(:each) do
      create(:user)
      visit new_password_path
      fill_in 'email', with: 'user@example.com'
      click_on '送信する'
      match_data = ActionMailer::Base.deliveries.last.body.parts[0].body.raw_source.match(%r{password/(.*)/edit})
      visit edit_password_path(id: match_data[1])

      fill_in 'user[password]', with: '12345678'
      fill_in 'user[password_confirmation]', with: '12345678'
    end
    
    # パスワードリセットに成功
    it 'Resets successfully (valid password)' do
      click_on '更新する'

      expect(page).to have_http_status :ok
      expect(current_path).to eq login_path
      expect(page).to have_text('パスワード再設定が完了しました')
    end
    
    # パスワードリセットに失敗（入力された確認用パスワードが異なるため）
    it 'Fails in password reset (wrong password_confirmation)' do
      fill_in 'user[password_confirmation]', with: '12341234'
      
      click_on '更新する'

      expect(page).to have_http_status :ok
      expect(page).to have_text('確認用パスワードとパスワードの入力が一致しません')
    end
    
    # パスワードリセットに失敗（入力されたパスワードが短すぎるため[最低8文字以上]）    
    it 'Fails in password reset (too short password)' do
      fill_in 'user[password]', with: '1234'
      fill_in 'user[password_confirmation]', with: '1234'
      
      click_on '更新する'

      expect(page).to have_http_status :ok
      expect(page).to have_text('パスワード再設定に失敗しました')
    end
    
    # パスワードリセットに失敗（空白の状態で送信されたため） 
    it 'Fails in password reset (in blank)' do
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      
      click_on '更新する'

      expect(page).to have_http_status :ok
      expect(page).to have_text('パスワードが空です')
    end
  end
end