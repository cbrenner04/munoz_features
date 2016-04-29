# filename: spec/features/participants/participant_bugs_spec.rb

require './spec/support/participants_helper'
require './spec/support/participants/stop_smoking_guide_helper'

feature 'A registered and consented participant signs in',
        metadata: :participant do
  context 'in English' do
    scenario 'switches language at the end of a stop smoking guide, ' \
       'navigates to the next guide, sees the correct text' do
      participant_121.sign_in
      visit stop_smoking_guide_eng.stop_smoking_guide_page
      stop_smoking_guide_eng.click_how_can_i_quit

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_quit_2_title

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_quit_3_title

      participant_121.go_to('Español')

      expect(stop_smoking_guide_esp).to have_why_quit_3_title

      expect(stop_smoking_guide_esp).to have_why_quit_body_3

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_quit_guide_visible

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      expect(stop_smoking_guide_esp).to have_how_to_quit_body
    end
  end

  context 'in Español' do
    scenario 'switches language at the end of a stop smoking guide, ' \
       'navigates to the next guide, sees the correct text' do
      participant_225.sign_in
      visit stop_smoking_guide_esp.stop_smoking_guide_page
      stop_smoking_guide_esp.click_how_can_i_quit

      expect(stop_smoking_guide_esp).to have_how_to_quit_1_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_quit_2_title

      stop_smoking_guide_esp.click_next

      expect(stop_smoking_guide_esp).to have_how_to_quit_3_title

      participant_225.go_to('English')

      expect(stop_smoking_guide_eng).to have_why_quit_3_title

      expect(stop_smoking_guide_eng).to have_why_quit_body_3

      stop_smoking_guide_eng.click_next

      expect(stop_smoking_guide_eng).to have_how_to_quit_guide_visible

      expect(stop_smoking_guide_eng).to have_how_to_quit_1_title

      expect(stop_smoking_guide_eng).to have_how_to_quit_body
    end
  end
end
