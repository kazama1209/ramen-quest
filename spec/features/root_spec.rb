require 'rails_helper'

RSpec.feature 'Root', type: :feature do
  
  feature 'Visit' do
    
    # ルートページ
    it 'Root' do
      visit root_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq root_path
    end
  end
end