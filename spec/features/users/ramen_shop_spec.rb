require 'rails_helper'

RSpec.feature 'Ramen_shops', type: :feature do
  
  let(:user) { create(:user) }
  
  before(:each) do
    login(user)
  end
  
  feature 'Visit' do
    
    # イベント追加ページ
    it 'Ramen_shops page' do
      visit ramen_shops_path
      expect(page).to have_http_status :ok
      
      click_on '追加する'
      
      expect(current_path).to eq new_ramen_shop_path
      expect(page).to have_text '店舗情報を登録する '
    end
  end
  
  feature 'Controll' do
    
    # ラーメン店の追加に成功
    it 'Adds ramen_shop successfully ' do
      visit new_ramen_shop_path    
      fill_in 'ramen_shop_name', with: 'テスト'
      select '東京都', from: 'ramen_shop_prefecture'
      fill_in 'ramen_shop_address', with: 'テスト'
      fill_in 'ramen_shop_phone', with: '012-3456-7890'
      find_by_id('ramen_shop_image').click
      attach_file('ramen_shop[image]', 'spec/fixtures/test.jpg')
      
      expect {
        click_on '登録する'
        
        expect(page).to have_http_status :ok
        expect(current_path).to eq ramen_shops_path
        expect(page).to have_text '店舗情報を追加しました'
      }.to change(RamenShop, :count).by 1
    end
  end
end