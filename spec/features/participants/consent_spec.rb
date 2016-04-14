# filename: spec/features/participants/consent_spec.rb

require './lib/zip_codes'
require './spec/support/participants/consent_helper'
require './spec/support/participants_helper'

feature 'A visitor to the site', metadata: :participant do
  context 'in English' do
    scenario 'switches to Español when consenting' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_35_eligibility.enter_sf_zip
      ptp_35_eligibility.answer_medical_care
      ptp_35_eligibility.enter_email
      ptp_35_eligibility.enter_phone_num
      ptp_35_eligibility.enter_password
      eligibility_eng.click_submit
      eligibility_eng.click_view_consent

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      participant_35.switch_language

      expect(consent_esp).to be_visible

      expect(consent_esp).to have_consent_response
    end

    scenario 'cannot review consent immediately ' \
                'following ineligible decision' do
      visit eligibility_eng.ineligible_page

      expect(consent_eng).to have_no_consent_link
    end

    scenario 'completes eligibility, is eligible, ' \
             'is able to consent immediately' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_36_eligibility.enter_sf_zip
      ptp_36_eligibility.answer_medical_care
      ptp_36_eligibility.enter_email
      ptp_36_eligibility.enter_phone_num
      ptp_36_eligibility.enter_password
      eligibility_eng.click_submit
      eligibility_eng.click_view_consent

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.click_submit

      expect(consent_eng).to be_submitted
    end

    scenario 'switches to Español while filling in eligibility, ' \
       'is eligible, sees consent form in Español' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      participant_37.switch_language
      eligibility_esp.find_age
      ptp_37_eligibility.enter_sf_zip
      ptp_37_eligibility.answer_medical_care
      ptp_37_eligibility.enter_email
      ptp_37_eligibility.enter_phone_num
      ptp_37_eligibility.enter_password
      eligibility_esp.click_submit
      eligibility_esp.click_view_consent

      expect(consent_esp).to be_visible
    end

    scenario 'signs in and consents to participate' do
      participant_106.sign_in

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.click_submit

      expect(consent_eng).to be_submitted
    end

    scenario 'signs in and does not consent to participate' do
      participant_107.sign_in

      expect(consent_eng).to be_visible

      consent_eng.decline_consent
      consent_eng.click_submit

      expect(consent_eng).to be_submitted
    end

    scenario 'reviews consent form' do
      participant_109.sign_in

      expect(participant_109).to be_on_landing_page

      participant_109.go_to('Review Consent')

      expect(consent_eng).to be_visible
    end

    scenario 'switches to Español when reviewing consent form' do
      participant_131.sign_in

      expect(participant_131).to be_on_landing_page
      participant_131.go_to('Review Consent')

      expect(consent_eng).to be_visible

      sleep(2)
      participant_131.switch_language

      expect(consent_esp).to be_visible
    end

    # Will return once objects for other parts of the app are complete.

    scenario 'is a participant who did not give consent, can still use app' do
      participant_108.sign_in

      expect(participant_108).to be_on_landing_page

      ptp_108_consent.click_set_quit_date

      expect(ptp_108_consent).to have_quit_date_visible

      participant_108.go_to_root
      ptp_108_consent.click_stop_smoke_guide

      expect(stop_smoking_guide_eng).to be_visible

      participant_108.go_to_root
      ptp_108_consent.click_cig_counter

      expect(cigarette_counter_eng).to be_visible

      participant_108.go_to_root
      participant_108.go_to('Review Consent')

      expect(consent_eng).to be_visible
    end
  end

  # Spanish

  context 'in Español' do
    scenario 'switches to English when consenting' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_38_eligibility.enter_sf_zip
      ptp_38_eligibility.answer_medical_care
      ptp_38_eligibility.enter_email
      ptp_38_eligibility.enter_phone_num
      ptp_38_eligibility.enter_password
      eligibility_esp.click_submit
      eligibility_esp.click_view_consent

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      participant_38.switch_language

      expect(consent_eng).to be_visible

      expect(consent_eng).to have_consent_response
    end

    scenario 'cannot review consent immediately' \
        'following ineligible decision' do
      visit eligibility_esp.ineligible_page

      expect(consent_esp).to have_no_consent_link
    end

    scenario 'completes eligibility, is eligible,' \
        'is able to consent immediately' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_39_eligibility.enter_sf_zip
      ptp_39_eligibility.answer_medical_care
      ptp_39_eligibility.enter_email
      ptp_39_eligibility.enter_phone_num
      ptp_39_eligibility.enter_password
      eligibility_esp.click_submit
      eligibility_esp.click_view_consent

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      consent_esp.click_submit

      expect(consent_esp).to be_submitted
    end

    scenario 'switches to English while filling in eligibility, ' \
       'is eligible, sees consent form in English' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      participant_40.switch_language
      ptp_40_eligibility.find_age
      ptp_40_eligibility.enter_sf_zip
      ptp_40_eligibility.answer_medical_care
      ptp_40_eligibility.enter_email
      ptp_40_eligibility.enter_phone_num
      ptp_40_eligibility.enter_password
      eligibility_eng.click_submit
      eligibility_eng.click_view_consent

      expect(consent_eng).to be_visible
    end

    scenario 'signs in and consents to participate' do
      participant_206.sign_in

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      consent_esp.click_submit

      expect(consent_esp).to be_submitted
    end

    scenario 'signs in and does not consent to participate' do
      participant_207.sign_in

      expect(consent_esp).to be_visible

      consent_esp.decline_consent
      consent_esp.click_submit

      expect(consent_esp).to be_submitted
    end

    scenario 'reviews consent form' do
      participant_209.sign_in

      expect(participant_209).to be_on_landing_page

      participant_209.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible
    end

    scenario 'switches to Español when reviewing consent form' do
      participant_231.sign_in

      expect(participant_231).to be_on_landing_page

      participant_231.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible

      sleep(2)
      participant_231.switch_language

      expect(consent_eng).to be_visible
    end

    # Will return once objects for other parts of the app are complete.

    scenario 'is a participant who did not give consent, can still use app' do
      participant_208.sign_in

      expect(participant_208).to be_on_landing_page

      ptp_208_consent.click_set_quit_date

      expect(ptp_208_consent).to have_quit_date_visible

      participant_208.go_to_root
      ptp_208_consent.click_stop_smoke_guide

      expect(stop_smoking_guide_esp).to be_visible

      participant_208.go_to_root
      ptp_208_consent.click_cig_counter

      expect(cigarette_counter_esp).to be_visible

      participant_208.go_to_root
      participant_208.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible
    end
  end
end
