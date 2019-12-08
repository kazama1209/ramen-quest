require 'rails_helper'

RSpec.feature "Opinions", type: :feature do
  feature 'Controll' do
    
    # 意見・要望の送信に成功
    it 'sends opinion successfully' do
      visit root_path
      fill_in 'opinion_content', with: 'テスト送信'
      
      expect do
        click_on '送信'
        
        expect(page).to have_http_status :ok
        expect(current_path).to eq root_path
        expect(page).to have_text 'ご意見・ご要望をいただきありがとうございました'
      end.to change(Opinion, :count).by 1
    end
  end
end