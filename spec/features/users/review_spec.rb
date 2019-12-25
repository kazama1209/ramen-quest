require 'rails_helper'

RSpec.feature 'Ramen_shops', type: :feature do
  
  let(:user) { create(:user) }
  let(:ramen_shop) { create(:ramen_shop) }
  
  before(:each) do
    login(user)
  end
  
  feature 'Visit' do
    
    # レビュー追加ページ
    it 'review page' do
      visit ramen_shop_path(ramen_shop.id)
      expect(page).to have_http_status :ok
      expect(current_path).to eq ramen_shop_path(ramen_shop.id)
      expect(page).to have_text 'レビューを書く '
    end
  end
  
  # feature 'Controll' do
    
  #   # レビューの追加に成功
  #   it 'Adds review successfully ' do
  #     visit ramen_shop_path(ramen_shop.id)
      
  #     fill_in 'review_title', with: 'テスト'
  #     find('#review_rate', visible: false).set(5)
  #     fill_in 'review_body', with: 'テスト'
  #     # find_by_id('img_field_0').click
  #     # attach_file('review[images][]', 'spec/fixtures/test.jpg', match: :first)
      
  #     expect {
  #       click_on '登録する'
        
  #       expect(page).to have_http_status :ok
  #       expect(current_path).to eq ramen_shop_path(ramen_shop.id)
  #       expect(page).to have_text 'レビューを投稿しました'
  #     }.to change(Review, :count).by 1
  #   end
  # end
end