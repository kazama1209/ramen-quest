require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  
  let(:user) { create(:user) }
  
  before(:each) do
    login(user)
  end
  
  feature 'Visit' do
    
    # イベント追加ページ
    it 'Event page' do
      visit mypage_events_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_events_path
      expect(page).to have_text '予定を入れる'
    end
  end
  
  feature 'Controll' do
    
    # イベントの追加に成功
    it 'Adds event successfully ' do
      visit mypage_events_path
      fill_in 'event_title', with: 'テスト'
      select '2019', from: 'event_start_time_1i'
      select '1月', from: 'event_start_time_2i'
      select '1', from: 'event_start_time_3i'
      select '00', from: 'event_start_time_4i'
      select '00', from: 'event_start_time_5i'
      
      expect {
        click_on '登録する'
        
        expect(page).to have_http_status :ok
        expect(current_path).to eq mypage_events_path
        expect(page).to have_text '予定を追加しました'
      }.to change(Event, :count).by 1
    end
  end
end