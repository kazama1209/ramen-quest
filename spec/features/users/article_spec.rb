require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  
  let(:user) { create(:admin) }
  let(:article) { create(:article) }
  
  before(:each) do
    login(user)
  end
  
  feature 'Visit' do
    
    # 記事一覧ページ
    it 'Article index' do
      visit articles_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq articles_path
      expect(page).to have_text 'ニュース'
    end
  end
end