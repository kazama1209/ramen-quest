require 'rails_helper'

RSpec.feature "Image Upload", type: :feature do
  
  feature 'Upload' do
    
    let(:user) { create(:user) }
    
    before(:each) do
      login(user)
    end
    
    # ユーザーに紐づく画像投稿
    it 'User image' do
      visit mypage_profile_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_profile_path
      expect(page).to have_text 'プロフィールの変更'
      
      find_by_id('user_image').click
      attach_file('user[image]', 'spec/fixtures/test.jpg')
      
      click_on '更新する'
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq dashboard_index_path
      expect(page).to have_text 'プロフィールを変更しました'
      expect(page).to have_selector("img[src$='test.jpg']")
    end
  end
end