# filename: spec/features/participants/feedback_spec.rb

require './spec/support/participants/feedback_helper'
require './spec/support/participants_helper'

feature 'An eligible participant', metadata: :participant do
  context 'in English' do
    scenario 'signs in, navigates to the feedback page' do
      participant_146.sign_in
      feedback_eng.find_stop_smoking_guide
      feedback_eng.open_with_navbar
      expect(feedback_eng).to be_visible
    end

    scenario 'signs in, rates the application' do
      participant_147.sign_in
      visit feedback_eng.feedback_page

      expect(feedback_eng).to have_count_0

      feedback_eng.click_btn_2
      feedback_eng.click_btn_16

      expect(feedback_eng).to have_count_2

      feedback_eng.counter_1_has_3

      feedback_eng.counter_2_has_6

      feedback_eng.submit

      expect(stop_smoking_guide_eng).to be_visible
    end

    scenario 'cannot enter rating if one is already entered' do
      participant_148.sign_in
      feedback_eng.find_stop_smoking_guide
      feedback_eng.click_navbar
      feedback_eng.find_settings_cog

      expect(feedback_eng).to have_no_feedback_link
    end
  end

  context 'in Español' do
    scenario 'signs in, navigates to the feedback page' do
      participant_246.sign_in
      feedback_esp.find_stop_smoking_guide
      feedback_esp.open_with_navbar
      expect(feedback_esp).to be_visible
    end

    scenario 'signs in, rates the application' do
      participant_247.sign_in
      visit feedback_esp.feedback_page

      expect(feedback_esp).to have_count_0

      feedback_esp.click_btn_2
      feedback_esp.click_btn_16

      expect(feedback_esp).to have_count_2

      feedback_esp.counter_1_has_3

      feedback_esp.counter_2_has_6

      feedback_esp.submit

      expect(stop_smoking_guide_esp).to be_visible
    end

    scenario 'cannot enter rating if one is already entered' do
      participant_248.sign_in
      feedback_esp.find_stop_smoking_guide
      feedback_esp.click_navbar
      feedback_esp.find_settings_cog

      expect(feedback_esp).to have_no_feedback_link
    end
  end
end
