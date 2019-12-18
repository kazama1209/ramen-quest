require 'rails_helper'

RSpec.feature "Bookmarks", type: :feature do
  
  let(:user) { create(:user) }
  let(:ramen_shop) { create(:ramen_shop) }
  
  before(:each) do
    login(user)
  end
  
  feature 'Visit' do
    
    # ラーメン店詳細ページ
    it 'Each ramen_shop page' do
      visit ramen_shop_path(ramen_shop.id)
      expect(page).to have_http_status :ok
      expect(current_path).to eq ramen_shop_path(ramen_shop.id)
      expect(page).to have_text 'レビューを書く'
    end
  end
  
  feature 'Controll' do
    before(:each) do
      visit ramen_shop_path(ramen_shop.id)
    end
    
    # 訪問済みにする
    it 'Creates completion' do
      expect {
        first(:css, '.completion').click
      }.to change(Completion, :count).by 1
    end
  end
end