require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  
  let(:user) { create(:user) }
  let(:ramen_shop) { create(:ramen_shop) }
  let(:review) { create(:review, ramen_shop_id: ramen_shop.id) }
  
  feature 'Visit' do
    
    # レビュー詳細ページ
    it 'Each review page' do
      login(user)
      visit review_path(review.id)
      expect(page).to have_http_status :ok
      expect(current_path).to eq review_path(review.id)
      expect(page).to have_text '美味しかったです。'
    end
  end
  
  feature 'Controll' do
    before(:each) do
      login(user)
      visit review_path(review.id)
    end
    
    # いいね！を付ける
    it 'Pushes like button' do
      expect {
        first(:css, '.btn-outline-dark').click
      }.to change(Like, :count).by 1
    end
  end
end