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
    
    # 「制覇」マークを付ける
    it 'Creates completion' do
      expect {
        first(:css, '.completion').click
        expect(page).to have_http_status :ok
        expect(current_path).to eq ramen_shop_path(ramen_shop.id)
      }.to change(Completion, :count).by 1
    end
    
    # ブックマークを取り消す
    it 'Destroys completion' do
      first(:css, '.completion').click
      
      expect {
        first(:css, '.incompletion').click
        expect(page).to have_http_status :ok
        expect(current_path).to eq ramen_shop_path(ramen_shop.id)
      }.to change(Completion, :count).by -1
    end
  end
end