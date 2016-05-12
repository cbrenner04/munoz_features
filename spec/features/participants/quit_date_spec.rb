# filename: spec/features/participants/quit_date_spec.rb

# require objects with datepicking and viewing methods
require './spec/support/participants/quit_date_helper'

feature 'A registered and consented participant signs in',
        metadata: :participant do
  context 'in English' do
    scenario 'navigates to Your Quit Date' do
      participant_160.sign_in
      quit_date_eng.click_set_quit_date

      expect(quit_date_eng).to have_set_quit_date_visible
    end

    scenario 'switches to Español while in Your Quit Date' do
      participant_134.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to have_quit_date_calendar

      participant_134.go_to('Español')

      expect(quit_date_esp).to have_quit_date_calendar
    end

    scenario 'navigates to Cigarette Counter from Set Your Quit Date' do
      participant_134.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to have_quit_date_calendar

      participant_134.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible
    end

    scenario "sees today's date highlighted", :date do
      participant_135.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to be_on_current_month

      expect(quit_date_eng).to have_todays_date_highlighted
    end

    scenario 'navigates to previous month within Your Quit Date' do
      participant_136.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to be_on_current_month

      quit_date_eng.click_previous_month

      expect(quit_date_eng).to have_previous_month_visible
    end

    scenario 'navigates to next month within Your Quit Date' do
      participant_137.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to be_on_current_month

      quit_date_eng.click_next_month

      expect(quit_date_eng).to have_next_month_visible
    end

    scenario 'navigates back to Today from another month' do
      participant_137.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to be_on_current_month

      quit_date_eng.click_next_month

      expect(quit_date_eng).to have_next_month_visible

      quit_date_eng.click_today_btn

      expect(quit_date_eng).to be_on_current_month
    end

    scenario 'sets a Quit Date', :date do
      participant_139.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow
      quit_date_eng.select_tomorrow

      expect(quit_date_eng).to have_tomorrows_date_highlighted
    end

    scenario 'sets initial Quit Date, sees no link to quit date on main page' do
      participant_149.sign_in

      expect(quit_date_eng).to have_root_visible

      expect(quit_date_eng).to have_set_quit_date_in_root

      quit_date_eng.click_navbar
      quit_date_eng.click_dropdown_toggle

      expect(quit_date_eng).to_not have_set_quit_date_in_dropdown

      quit_date_eng.click_navbar
      quit_date_eng.click_set_quit_date
      quit_date_eng.locate_tomorrow

      quit_date_eng.select_tomorrow

      expect(quit_date_eng).to have_tomorrow_header

      participant_149.go_to_root

      expect(quit_date_eng).to have_root_visible

      expect(quit_date_eng).to_not have_set_quit_date_in_root

      quit_date_eng.click_navbar
      quit_date_eng.click_dropdown_toggle

      expect(quit_date_eng).to have_set_quit_date_in_dropdown
    end

    scenario 'sets a Quit Date, chooses Done to return to home page' do
      participant_154.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to_not have_done_btn

      quit_date_eng.locate_tomorrow
      quit_date_eng.select_tomorrow
      quit_date_eng.click_done

      expect(quit_date_eng).to have_stop_smoking_guide
    end

    scenario 'has a Quit Date set, cannot access except through navbar' do
      participant_150.sign_in

      expect(quit_date_eng).to_not have_set_quit_date_in_root

      participant_150.go_to('Set Your Quit Date')

      expect(quit_date_eng).to have_tomorrow_header
    end

    scenario 'cannot set a Quit Date in the past', :date do
      participant_134.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_yesterday

      quit_date_eng.select_yesterday

      sleep(2)

      expect(quit_date_eng).to_not have_yesterdays_date_highlighted

      quit_date_eng.locate_tomorrow
      quit_date_eng.select_tomorrow

      expect(quit_date_eng).to have_tomorrows_date_highlighted
    end

    scenario 'sees Quit Date highlighted' do
      participant_141.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow

      expect(quit_date_eng).to have_tomorrows_date_highlighted
    end

    scenario 'sees Quit Date at the top of page' do
      participant_141.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow

      expect(quit_date_eng).to have_tomorrow_header_full_month
    end

    scenario 'updates a Quit Date', :date do
      participant_142.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow

      expect(quit_date_eng).to have_tomorrows_date_highlighted

      quit_date_eng.locate_two_days_away
      quit_date_eng.select_two_days_away

      expect(quit_date_eng).to have_two_days_away_date_highlighted
    end

    scenario 'cannot set a quit date more than 4 weeks from today', :date do
      participant_133.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_beyond_4_wks_away

      quit_date_eng.select_beyond_4_wks_away

      sleep(2)

      expect(quit_date_eng).to_not have_beyond_4_wks_away_date_highlighted

      quit_date_eng.locate_under_4_wks_away
      quit_date_eng.select_under_4_wks_away

      expect(quit_date_eng).to have_under_4_wks_away_date_highlighted
    end
  end

  # In Spanish

  context 'in Español' do
    scenario 'navigates to Your Quit Date' do
      participant_260.sign_in
      quit_date_esp.click_set_quit_date

      expect(quit_date_esp).to have_set_quit_date_visible
    end

    scenario 'switches to English while in Your Quit Date' do
      participant_234.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to have_quit_date_calendar

      participant_234.go_to('English')

      expect(quit_date_eng).to have_quit_date_calendar
    end

    scenario 'navigates to Cigarette Counter from Set Your Quit Date' do
      participant_234.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to have_quit_date_calendar

      participant_234.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible
    end

    scenario "sees today's date highlighted" do
      participant_235.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to be_on_current_month

      expect(quit_date_esp).to have_todays_date_highlighted
    end

    scenario 'navigates to previous month within Your Quit Date' do
      participant_236.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to be_on_current_month

      quit_date_esp.click_previous_month

      expect(quit_date_esp).to have_previous_month_visible
    end

    scenario 'navigates to next month within Your Quit Date' do
      participant_237.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to be_on_current_month

      quit_date_esp.click_next_month

      expect(quit_date_esp).to have_next_month_visible
    end

    scenario 'navigates back to Today from another month' do
      participant_237.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to be_on_current_month

      quit_date_esp.click_next_month

      expect(quit_date_esp).to have_next_month_visible

      quit_date_esp.click_today_btn

      expect(quit_date_esp).to be_on_current_month
    end

    scenario 'sees Quit Date highlighted' do
      participant_241.sign_in
      visit quit_date_esp.quit_date_page
      quit_date_esp.locate_tomorrow

      expect(quit_date_esp).to have_tomorrows_date_highlighted
    end

    scenario 'sees Quit Date at the top of page' do
      participant_241.sign_in
      visit quit_date_esp.quit_date_page
      quit_date_esp.locate_tomorrow

      expect(quit_date_esp).to have_tomorrow_header
    end

    scenario 'sets a Quit Date' do
      participant_239.sign_in
      visit quit_date_esp.quit_date_page
      quit_date_esp.locate_tomorrow
      quit_date_esp.select_tomorrow

      expect(quit_date_esp).to have_tomorrows_date_highlighted
    end

    scenario 'sets initial Quit Date, ' \
       'does not see link to quit date on main page' do
      participant_249.sign_in

      expect(quit_date_esp).to have_root_visible

      expect(quit_date_esp).to have_set_quit_date_in_root

      quit_date_esp.click_navbar
      quit_date_esp.click_dropdown_toggle

      expect(quit_date_esp).to_not have_set_quit_date_in_dropdown

      quit_date_esp.click_navbar
      quit_date_esp.click_set_quit_date
      quit_date_esp.locate_tomorrow

      quit_date_esp.select_tomorrow

      expect(quit_date_esp).to have_tomorrow_header

      participant_249.go_to_root

      expect(quit_date_esp).to have_root_visible

      expect(quit_date_esp).to_not have_set_quit_date_in_root

      quit_date_esp.click_navbar
      quit_date_esp.click_dropdown_toggle

      expect(quit_date_esp).to have_set_quit_date_in_dropdown
    end

    scenario 'sets a Quit Date, chooses Done to return to home page' do
      participant_254.sign_in
      visit quit_date_esp.quit_date_page

      expect(quit_date_esp).to_not have_done_btn

      quit_date_esp.locate_tomorrow
      quit_date_esp.select_tomorrow
      quit_date_esp.click_done

      expect(quit_date_esp).to have_stop_smoking_guide
    end

    scenario 'has a Quit Date set, ' \
       'cannot access Quit Date except through navbar' do
      participant_250.sign_in

      expect(quit_date_esp).to_not have_set_quit_date_in_root

      participant_250.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to have_tomorrow_header
    end

    scenario 'cannot set a Quit Date in the past' do
      participant_234.sign_in
      visit quit_date_esp.quit_date_page
      quit_date_esp.locate_yesterday

      quit_date_esp.select_yesterday

      sleep(2)

      expect(quit_date_esp).to_not have_yesterdays_date_highlighted

      quit_date_esp.locate_tomorrow
      quit_date_esp.select_tomorrow

      expect(quit_date_esp).to have_tomorrows_date_highlighted
    end

    scenario 'updates a Quit Date' do
      participant_242.sign_in
      visit quit_date_esp.quit_date_page
      quit_date_esp.locate_tomorrow

      expect(quit_date_esp).to have_tomorrows_date_highlighted

      quit_date_esp.locate_two_days_away
      quit_date_esp.select_two_days_away

      expect(quit_date_esp).to have_two_days_away_date_highlighted
    end

    scenario 'cannot set a quit date more than 4 weeks from today' do
      participant_233.sign_in
      visit quit_date_esp.quit_date_page
      quit_date_esp.locate_beyond_4_wks_away

      quit_date_esp.select_beyond_4_wks_away

      sleep(2)

      expect(quit_date_esp).to_not have_beyond_4_wks_away_date_highlighted

      quit_date_esp.locate_under_4_wks_away
      quit_date_esp.select_under_4_wks_away

      expect(quit_date_esp).to have_under_4_wks_away_date_highlighted
    end
  end
end
