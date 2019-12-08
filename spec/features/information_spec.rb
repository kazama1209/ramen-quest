require 'rails_helper'

RSpec.feature 'Informations', type: :feature do
  
  feature 'Visit' do
    
    # お知らせページ
    it 'Informations page' do
      visit informations_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq informations_path
      expect(page).to have_text 'お知らせ'
    end
  end
end