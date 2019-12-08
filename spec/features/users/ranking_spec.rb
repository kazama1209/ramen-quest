require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  
  let(:user) { create(:admin) }
  let(:ramen_shop) { create(:ramen_shop) }
  
  before(:each) do
    login(user)
  end
  
  feature 'Visit' do
    
    # ランキングページ
    it 'Ranking page' do
      visit ranking_index_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq ranking_index_path
      expect(page).to have_text '人気のラーメン店 '
    end
  end
end