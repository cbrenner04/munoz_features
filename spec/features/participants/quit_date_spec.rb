# filename: spec/features/participants/quit_date_spec.rb

# require objects with datepicking and viewing methods
require './spec/support/participants/quit_date_helper'
require './spec/support/participants_helper'

feature 'A registered and consented participant signs in',
         metadata: :participant do
  context 'in English' do
    scenario 'navigates to Your Quit Date' do
      participant_133.sign_in
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

      expect(quit_date_eng).to have_todays_date_highlighted

      quit_date_eng.view_today
    end

    scenario 'navigates to previous month within Your Quit Date' do
      participant_136.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to have_todays_date_highlighted

      quit_date_eng.click_previous_month

      expect(quit_date_eng).to have_previous_month_in_quit_date
    end

    scenario 'navigates to next month within Your Quit Date' do
      participant_137.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to have_todays_date_highlighted

      quit_date_eng.click_next_month
      quit_date_eng.pick_next_month_date

      expect(quit_date_eng).to have_next_month_in_quit_date
    end

    scenario 'navigates back to Today from another month' do
      participant_137.sign_in
      visit quit_date_eng.quit_date_page

      expect(quit_date_eng).to have_todays_date_highlighted

      quit_date_eng.click_next_month
      quit_date_eng.pick_next_month_date

      expect(quit_date_eng).to have_next_month_in_quit_date

      quit_date_eng.click_today_btn

      expect(quit_date_eng).to have_todays_date_highlighted
    end

    scenario 'sets a Quit Date', :date do
      participant_139.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow
      quit_date_eng.select_tomorrow

      expect(quit_date_eng).to have_tomorrows_date_highlighted
    end

    scenario 'sets initial Quit Date, does not see link to quit date on main page' do
      participant_149.sign_in
      quit_date_eng.click_navbar
      quit_date_eng.click_dropdown_toggle

      expect(quit_date_eng.dropdown).to have_set_quit_date_in_dropdown

      quit_date_eng.click_navbar_set_quit_date
      quit_date_eng.locate_tomorrow

      quit_date_eng.select_tomorrow

      expect(quit_date_eng).to has_tomorrow_header

      participant_149.go_to_root

      expect(quit_date_eng).to has_root_visible

      expect(quit_date_eng).to_not have_set_quit_date_in_root
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

    scenario 'has a Quit Date set, cannot access Quit Date except through navbar' do
      participant_150.sign_in

      expect(quit_date_eng).to_not have_set_quit_date_in_root

      participant_150.go_to('Set Your Quit Date')

      expect(quit_date_eng).to have_tomorrow_header
    end

    scenario 'cannot set a Quit Date in the past', :date do
      participant_134.sign_in
      visit quit_date_eng.quit_date_page
      yesterday = Date.today - 1
      unless page.has_css?('.ng-binding',
                           text: "#{yesterday.strftime('%b %Y')}")
        find('a', text: 'Prev.').click
      end

      datepicker.select_day("#{yesterday}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{yesterday.strftime('%-d')}")
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end
      quit_date_eng.select_tomorrow
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tomorrow.strftime('%-d')}")
    end

    scenario 'sees Quit Date highlighted' do
      participant_141.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow

      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tomorrow.strftime('%-d')}")
    end

    scenario 'sees Quit Date at the top of page' do
      participant_141.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow

      expect(page)
        .to have_css('h3', text: "Date: #{tomorrow.strftime('%B %-d')}")
    end

    scenario 'updates a Quit Date', :date do
      participant_142.sign_in
      visit quit_date_eng.quit_date_page
      quit_date_eng.locate_tomorrow

      find('.text-right.ng-binding.ng-scope.success',
           text: "#{tomorrow.strftime('%-d')}")
      two_days = Date.today + 2
      unless page.has_css?('.ng-binding', text: "#{two_days.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      datepicker.select_day("#{two_days}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{two_days.strftime('%-d')}")
    end

    scenario 'cannot set a quit date more than 4 weeks from today', :date do
      participant_133.sign_in
      visit quit_date_eng.quit_date_page
      beyond_four_wks = Date.today + 30
      unless page.has_css?('.ng-binding',
                           text: "#{beyond_four_wks.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      datepicker.select_day("#{beyond_four_wks}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{beyond_four_wks.strftime('%-d')}")

      under_four_wks = Date.today + 25
      unless page.has_css?('.ng-binding',
                           text: "#{under_four_wks.strftime('%b %Y')}")
        find('a', text: 'Prev').click
      end
      datepicker.select_day("#{under_four_wks}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{under_four_wks.strftime('%-d')}")
    end
  end

  # In Spanish

  context 'in Español' do
    scenario 'navigates to Your Quit Date' do
      participant_233.sign_in
      quit_date_esp.click_set_quit_date
      expect(page).to have_css '.previous'
    end

    scenario 'switches to English while in Your Quit Date' do
      participant_234.sign_in
      visit quit_date_esp.quit_date_page
      find('.ng-binding.ng-scope', text: 'Mi')
      participant_234.go_to('English')
      expect(page).to have_css('.ng-binding.ng-scope', text: 'We')
    end

    scenario 'navigates to Cigarette Counter from Set Your Quit Date' do
      participant_234.sign_in
      visit quit_date_esp.quit_date_page
      find('.ng-binding.ng-scope', text: 'Mi')
      participant_234.navigate_to('Contador de Cigarrillos')
      expect(page).to have_css('.pull-left', text: 'Ayer')
    end

    scenario "sees today's date highlighted" do
      participant_235.sign_in
      visit quit_date_esp.quit_date_page
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      quit_date_esp.view_day
    end

    scenario 'navigates to previous month within Your Quit Date' do
      participant_236.sign_in
      visit quit_date_esp.quit_date_page
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      quit_date_esp.click_previous_month

      expect(quit_date_esp).to have_previous_month_in_quit_date
    end

    scenario 'navigates to next month within Your Quit Date' do
      participant_237.sign_in
      visit quit_date_esp.quit_date_page
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      quit_date_esp.click_next_month
      quit_date_esp.pick_next_month_date

      expect(page)
        .to have_css('.ng-binding',
                     text: trans_mo("#{next_month.strftime('%b. %Y')}"))
    end

    scenario 'navigates back to Today from another month' do
      participant_237.sign_in
      visit quit_date_esp.quit_date_page
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      find('a', text: 'Sig.').click
      quit_date_esp.pick_next_month_date
      find('.ng-binding',
           text: trans_mo("#{next_month.strftime('%b. %Y')}"))
      find('a', text: 'Hoy').click
      expect(page)
        .to have_css('.ng-binding',
                     text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
    end

    scenario 'sees Quit Date highlighted' do
      participant_241.sign_in
      visit quit_date_esp.quit_date_page
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    scenario 'sees Quit Date at the top of page' do
      participant_241.sign_in
      visit quit_date_esp.quit_date_page
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      expect(page)
        .to have_css('h3', text: "Dejará de Fumar: #{tom.strftime('%-d')}")
    end

    scenario 'sets a Quit Date' do
      participant_239.sign_in
      visit quit_date_esp.quit_date_page
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      quit_date_esp.select_tomorrow
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    scenario 'sets initial Quit Date, does not see link to quit date on main page' do
      participant_249.sign_in
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      expect('.dropdown-menu')
        .to_not have_css('.ng-binding',
                         text: 'Elija la fecha en que dejará de fumar')

      find('a', text: 'Elija la fecha en que dejará de fumar').click
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      quit_date_esp.select_tomorrow
      find('h3', text: "#{tom.strftime('%-d')}")

      participant_249.go_to_root
      find('a', text: 'Contador de Cigarrillos')
      expect(page).to_not have_content 'Elija la fecha en que dejará de fumar'
    end

    scenario 'sets a Quit Date, chooses Done to return to home page' do
      participant_254.sign_in
      visit quit_date_esp.quit_date_page
      expect(page).to_not have_css('.btn.btn-default', text: 'Done')
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tomorrow.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      quit_date_esp.select_tomorrow
      find('.btn.btn-default', text: 'Fijar').click
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end

    scenario 'has a Quit Date set, cannot access Quit Date except through navbar' do
      participant_250.sign_in
      expect(page)
        .to_not have_css('a', text: 'Elija la fecha en que dejará de fumar')
      participant_250.go_to('Elija la fecha en que dejará de fumar')
      tomorrow = Date.today + 1
      expect(page).to have_css('h3', text: "#{tomorrow.strftime('%-d')}")
    end

    scenario 'cannot set a Quit Date in the past' do
      participant_234.sign_in
      visit quit_date_esp.quit_date_page
      yes = Date.today - 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{yes.strftime('%b. %Y')}"))
        find('a', text: 'Volver').click
      end

      datepicker.select_day("#{yes}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{yes.strftime('%-d')}")
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end
      quit_date_esp.select_tomorrow
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    scenario 'updates a Quit Date' do
      participant_242.sign_in
      visit quit_date_esp.quit_date_page
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      find('.text-right.ng-binding.ng-scope.success',
           text: "#{tom.strftime('%-d')}")
      two_day = Date.today + 2
      unless page
             .has_css?('.ng-binding',
                       text: trans_mo("#{two_day.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      datepicker.select_day("#{two_day}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{two_day.strftime('%-d')}")
    end

    scenario 'cannot set a quit date more than 4 weeks from today' do
      participant_233.sign_in
      visit quit_date_esp.quit_date_page
      beyond_four_wks = Date.today + 30
      unless page
             .has_css?('.ng-binding',
                       text: trans_mo("#{beyond_four_wks.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      datepicker.select_day("#{beyond_four_wks}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{beyond_four_wks.strftime('%-d')}")

      under_four_wks = Date.today + 25
      unless page
             .has_css?('.ng-binding',
                       text: trans_mo("#{under_four_wks.strftime('%b. %Y')}"))
        find('a', text: 'Volver').click
      end
      datepicker.select_day("#{under_four_wks}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{under_four_wks.strftime('%-d')}")
    end
  end
end
