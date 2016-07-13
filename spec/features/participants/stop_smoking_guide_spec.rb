# frozen_string_literal: true
# filename: spec/features/participants/stop_smoking_guide_spec.rb

require './spec/support/participants/stop_smoking_guide_helper'

feature 'A registered and consented participant signs in',
        metadata: :participant do
  context 'in English' do
    scenario 'navigates to the Stop Smoking Guide menu' do
      participant_117.sign_in
      stop_smoking_guide_eng.click_stop_smoking_guide

      expect(stop_smoking_guide_eng).to be_visible
    end

    scenario 'switches to Español in Stop Smoking Guide menu' do
      participant_126.sign_in
      stop_smoking_guide_eng.click_stop_smoking_guide

      expect(stop_smoking_guide_eng).to be_visible

      participant_126.go_to('Español')

      expect(stop_smoking_guide_esp).to be_visible
    end

    scenario 'navigates to Set Your Quit Date from Stop Smoking Guide menu' do
      participant_126.sign_in
      stop_smoking_guide_eng.click_stop_smoking_guide

      expect(stop_smoking_guide_eng).to be_visible

      participant_126.go_to('Set Your Quit Date')

      expect(quit_date_eng).to be_visible
    end

    scenario 'navigates to Cigarette Counter from Stop Smoking Guide menu' do
      participant_126.sign_in
      stop_smoking_guide_eng.click_stop_smoking_guide

      expect(stop_smoking_guide_eng).to be_visible

      participant_126.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible
    end

    scenario 'navigates to How to Help guide' do
      participant_118.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_to_help_someone

      expect(stop_smoking_guide_eng).to have_how_to_help_someone_visible

      expect(stop_smoking_guide_eng).to have_how_to_help_1_title

      expect(stop_smoking_guide_eng).to have_how_to_help_body
    end

    scenario 'completes How to Help guide' do
      participant_119.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_to_help_someone

      expect(stop_smoking_guide_eng).to have_how_to_help_1_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_help_2_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_help_3_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to be_visible
    end

    scenario 'switches to Español in How to Help guide' do
      participant_127.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_to_help_someone

      expect(stop_smoking_guide_eng).to have_how_to_help_1_title

      participant_127.go_to('Español')

      expect(stop_smoking_guide_esp).to have_how_to_help_someone_visible

      expect(stop_smoking_guide_esp).to have_how_to_help_1_title

      expect(stop_smoking_guide_esp).to have_how_to_help_body
    end

    scenario 'navigates to Set Your Quit Date from How to Help guide' do
      participant_127.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_to_help_someone

      expect(stop_smoking_guide_eng).to have_how_to_help_1_title

      participant_127.go_to('Set Your Quit Date')

      expect(quit_date_eng).to be_visible
    end

    scenario 'navigates to Cigarette Counter from How to Help guide' do
      participant_127.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_to_help_someone

      expect(stop_smoking_guide_eng).to have_how_to_help_1_title

      participant_127.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible
    end

    scenario 'navigates to How to Quit guide' do
      participant_120.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_can_i_quit

      expect(stop_smoking_guide_eng).to have_how_to_quit_guide_visible

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      expect(stop_smoking_guide_eng).to have_how_to_quit_body
    end

    scenario 'completes How to Quit guide' do
      participant_121.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_can_i_quit

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_quit_2_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_quit_3_title

      stop_smoking_guide_eng.click_next

      # page.execute_script('window.location.reload()')
      expect(stop_smoking_guide_eng). to have_what_if_1_title
    end

    scenario 'switches to Español in How to Quit guide' do
      participant_128.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_can_i_quit

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      participant_128.go_to('Español')

      expect(stop_smoking_guide_esp).to have_how_to_quit_guide_visible

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      expect(stop_smoking_guide_esp).to have_how_to_quit_body
    end

    scenario 'navigates to Set Your Quit Date from How to Quit guide' do
      participant_128.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_can_i_quit

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      participant_128.go_to('Set Your Quit Date')

      expect(quit_date_eng).to be_visible
    end

    scenario 'navigates to Cigarette Counter from How to Quit guide' do
      participant_128.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_can_i_quit

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      participant_128.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible
    end

    scenario 'navigates to What If guide' do
      participant_122.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_what_if_i_start_again

      expect(stop_smoking_guide_eng).to have_what_if_guide_visible

      expect(stop_smoking_guide_eng).to have_what_if_1_title

      expect(stop_smoking_guide_eng).to have_what_if_body
    end

    scenario 'completes What if guide' do
      participant_123.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_what_if_i_start_again

      expect(stop_smoking_guide_eng).to have_what_if_1_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_what_if_2_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_what_if_3_title

      stop_smoking_guide_eng.click_next

      # page.execute_script('window.location.reload()')
      expect(stop_smoking_guide_eng).to have_how_to_help_1_title
    end

    scenario 'switches to Español in What if guide' do
      participant_129.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_what_if_i_start_again

      expect(stop_smoking_guide_eng).to have_what_if_1_title

      participant_129.go_to('Español')

      expect(stop_smoking_guide_esp).to have_what_if_guide_visible

      expect(stop_smoking_guide_esp).to have_what_if_1_title

      expect(stop_smoking_guide_esp).to have_what_if_body
    end

    scenario 'navigates to Set Your Quit Date from What if guide' do
      participant_129.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_what_if_i_start_again

      expect(stop_smoking_guide_eng).to have_what_if_1_title

      participant_129.go_to('Set Your Quit Date')

      expect(quit_date_eng).to be_visible
    end

    scenario 'navigates to Cigarette Counter from What if guide' do
      participant_129.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_what_if_i_start_again

      expect(stop_smoking_guide_eng).to have_what_if_1_title

      participant_129.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible
    end

    scenario 'navigates to Why Quit guide' do
      participant_124.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_why_quit

      expect(stop_smoking_guide_eng).to have_why_quit_visible

      expect(stop_smoking_guide_eng).to have_why_quit_1_title

      expect(stop_smoking_guide_eng).to have_why_quit_body
    end

    scenario 'completes Why Quit guide' do
      participant_125.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_why_quit

      expect(stop_smoking_guide_eng).to have_why_quit_1_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_why_quit_2_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_why_quit_3_title

      stop_smoking_guide_eng.click_next

      # page.execute_script('window.location.reload()')
      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title
    end

    scenario 'switches to Español in Why Quit guide' do
      participant_130.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_why_quit

      expect(stop_smoking_guide_eng).to have_why_quit_1_title

      participant_130.go_to('Español')

      expect(stop_smoking_guide_esp).to have_why_quit_visible

      expect(stop_smoking_guide_esp).to have_why_quit_1_title

      expect(stop_smoking_guide_esp).to have_why_quit_body
    end

    scenario 'navigates to Set Your Quit Date from Why Quit guide' do
      participant_130.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_why_quit

      expect(stop_smoking_guide_eng).to have_why_quit_1_title

      participant_130.go_to('Set Your Quit Date')

      expect(quit_date_eng).to be_visible
    end

    scenario 'navigates to Cigarette Counter from Why Quit guide' do
      participant_130.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_why_quit

      expect(stop_smoking_guide_eng).to have_why_quit_1_title

      participant_130.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible
    end
  end

  # Spanish

  context 'in Español' do
    scenario 'navigates to the Stop Smoking Guide menu' do
      participant_217.sign_in
      stop_smoking_guide_esp.click_stop_smoking_guide

      expect(stop_smoking_guide_esp).to be_visible
    end

    scenario 'switches to English in Stop Smoking Guide menu' do
      participant_226.sign_in
      stop_smoking_guide_esp.click_stop_smoking_guide

      expect(stop_smoking_guide_esp).to be_visible

      participant_226.go_to('English')

      expect(stop_smoking_guide_eng).to be_visible
    end

    scenario 'navigates to Set Your Quit Date from Stop Smoking Guide Menu' do
      participant_226.sign_in
      stop_smoking_guide_esp.click_stop_smoking_guide

      expect(stop_smoking_guide_esp).to be_visible

      participant_226.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to be_visible
    end

    scenario 'navigates to Cigarette Counter from Stop Smoking Guide Menu' do
      participant_226.sign_in
      stop_smoking_guide_esp.click_stop_smoking_guide

      expect(stop_smoking_guide_esp).to be_visible

      participant_226.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible
    end

    scenario 'navigates to How to Help guide' do
      participant_218.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_to_help_someone

      expect(stop_smoking_guide_esp).to have_how_to_help_someone_visible

      expect(stop_smoking_guide_esp).to have_how_to_help_1_title

      expect(stop_smoking_guide_esp).to have_how_to_help_body
    end

    scenario 'completes How to Help guide' do
      participant_219.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_to_help_someone

      expect(stop_smoking_guide_esp).to have_how_to_help_1_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_help_2_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_help_3_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to be_visible
    end

    scenario 'switches to English in How to Help guide' do
      participant_227.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_to_help_someone

      expect(stop_smoking_guide_esp).to have_how_to_help_1_title

      participant_227.go_to('English')

      expect(stop_smoking_guide_eng).to have_how_to_help_someone_visible

      expect(stop_smoking_guide_eng).to have_how_to_help_1_title

      expect(stop_smoking_guide_eng).to have_how_to_help_body
    end

    scenario 'navigates to Set Your Quit Date from How to Help guide' do
      participant_227.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_to_help_someone

      expect(stop_smoking_guide_esp).to have_how_to_help_1_title

      participant_227.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to be_visible
    end

    scenario 'navigates to Cigarette Counter from How to Help guide' do
      participant_227.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_to_help_someone

      expect(stop_smoking_guide_esp).to have_how_to_help_1_title

      participant_227.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible
    end

    scenario 'navigates to How to Quit guide' do
      participant_220.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_can_i_quit

      expect(stop_smoking_guide_esp).to have_how_to_quit_guide_visible

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      expect(stop_smoking_guide_esp).to have_how_to_quit_body
    end

    scenario 'completes How to Quit guide' do
      participant_221.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_can_i_quit

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_quit_2_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_quit_3_title

      stop_smoking_guide_esp.click_next

      # page.execute_script('window.location.reload()')
      expect(stop_smoking_guide_esp).to have_what_if_guide_visible
    end

    scenario 'switches to English in How to Quit guide' do
      participant_228.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_can_i_quit

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      participant_228.go_to('English')

      expect(stop_smoking_guide_eng).to have_how_to_quit_guide_visible

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      expect(stop_smoking_guide_eng).to have_how_to_quit_body
    end

    scenario 'navigates to Set Your Quit Date from How to Quit guide' do
      participant_228.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_can_i_quit

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      participant_228.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to be_visible
    end

    scenario 'navigates to Cigarette Counter from How to Quit guide' do
      participant_228.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_can_i_quit

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      participant_228.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible
    end

    scenario 'navigates to What If guide' do
      participant_222.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_what_if_i_start_again

      expect(stop_smoking_guide_esp).to have_what_if_guide_visible

      expect(stop_smoking_guide_esp).to have_what_if_1_title

      expect(stop_smoking_guide_esp).to have_what_if_body
    end

    scenario 'completes What if guide' do
      participant_223.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_what_if_i_start_again

      expect(stop_smoking_guide_esp).to have_what_if_1_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_what_if_2_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_what_if_3_title

      stop_smoking_guide_esp.click_next

      # page.execute_script('window.location.reload()')
      expect(stop_smoking_guide_esp).to have_how_to_help_1_title
    end

    scenario 'switches to English in the What if guide' do
      participant_229.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_what_if_i_start_again

      expect(stop_smoking_guide_esp).to have_what_if_1_title

      participant_229.go_to('English')

      expect(stop_smoking_guide_eng).to have_what_if_guide_visible

      expect(stop_smoking_guide_eng).to have_what_if_1_title

      expect(stop_smoking_guide_eng).to have_what_if_body
    end

    scenario 'navigates to Set Your Quit Date from What if guide' do
      participant_229.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_what_if_i_start_again

      expect(stop_smoking_guide_esp).to have_what_if_1_title

      participant_229.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to be_visible
    end

    scenario 'navigates to Cigarette Counter from What if guide' do
      participant_229.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_what_if_i_start_again

      expect(stop_smoking_guide_esp).to have_what_if_1_title

      participant_229.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible
    end

    scenario 'navigates to Why Quit guide' do
      participant_224.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_why_quit

      expect(stop_smoking_guide_esp).to have_why_quit_visible

      expect(stop_smoking_guide_esp).to have_why_quit_1_title

      expect(stop_smoking_guide_esp).to have_why_quit_body
    end

    scenario 'completes Why Quit guide' do
      participant_225.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_why_quit

      expect(stop_smoking_guide_esp).to have_why_quit_1_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_why_quit_2_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_why_quit_3_title

      stop_smoking_guide_esp.click_next

      # page.execute_script('window.location.reload()')
      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title
    end

    scenario 'switches to English in the Why Quit guide' do
      participant_230.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_why_quit

      expect(stop_smoking_guide_esp).to have_why_quit_1_title

      participant_230.go_to('English')

      expect(stop_smoking_guide_eng).to have_why_quit_visible

      expect(stop_smoking_guide_eng).to have_why_quit_1_title

      expect(stop_smoking_guide_eng).to have_why_quit_body
    end

    scenario 'navigates to Set Your Quit Date from Why Quit guide' do
      participant_230.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_why_quit

      expect(stop_smoking_guide_esp).to have_why_quit_1_title

      participant_230.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to be_visible
    end

    scenario 'navigates to Cigarette Counter from Why Quit guide' do
      participant_230.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_why_quit

      expect(stop_smoking_guide_esp).to have_why_quit_1_title

      participant_230.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible
    end
  end
end
