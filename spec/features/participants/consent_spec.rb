# filename: spec/features/participants/consent_spec.rb

require './lib/zip_codes.rb'
require './spec/support/participants/consent_helper'
require './spec/support/participants_helper'

feature 'A visitor to the site', metadata: :participant do
  context 'in English' do
    scenario 'switches to Español when consenting' do
      visit consent_eng.eligibility_page
      ptp_35_consent.find_age
      ptp_35_consent.set_age
      ptp_35_consent.answer_smoker
      ptp_35_consent.enter_sf_zip
      ptp_35_consent.answer_medical_care
      ptp_35_consent.enter_email
      ptp_35_consent.enter_phone_num
      ptp_35_consent.enter_password
      consent_eng.click_eligibility_submit
      consent_eng.click_view_consent

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.switch_language

      expect(consent_esp).to be_visible

      expect(consent_esp).to have_consent_response
    end

    scenario 'cannot review consent immediately' \
                'following ineligible decision' do
      visit consent_eng.ineligible_page

      expect(consent_eng).to have_no_consent_link
    end

    scenario 'completes eligibility, is eligible,' \
             'is able to consent immediately' do
      visit consent_eng.eligibility_page
      ptp_36_consent.find_age
      ptp_36_consent.set_age
      ptp_36_consent.answer_smoker
      ptp_36_consent.enter_sf_zip
      ptp_36_consent.answer_medical_care
      ptp_36_consent.enter_email
      ptp_36_consent.enter_phone_num
      ptp_36_consent.enter_password
      consent_eng.click_eligibility_submit
      consent_eng.click_view_consent

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.click_submit_consent

      expect(consent_eng).to have_consent_submitted_page
    end

    scenario 'switches to Español while filling in eligibility, ' \
       'is eligible, sees consent form in Español' do
      visit consent_eng.eligibility_page
      consent_eng.find_age
      consent_eng.set_age
      consent_eng.answer_smoker
      consent_eng.switch_language
      ptp_37_consent.find_age
      ptp_37_consent.enter_sf_zip
      ptp_37_consent.answer_medical_care
      ptp_37_consent.enter_email
      ptp_37_consent.enter_phone_num
      ptp_37_consent.enter_password
      consent_esp.click_eligibility_submit
      consent_esp.click_view_consent

      expect(consent_esp).to be_visible
    end

    scenario 'signs in and consents to participate' do
      participant_106.sign_in

      expect(consent_eng).to be_on_landing_page?

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.click_submit_consent

      expect(consent_eng).to have_consent_submitted_page
    end

    scenario 'signs in and does not consent to participate' do
      participant_107.sign_in

      expect(consent_eng).to be_on_landing_page?

      expect(consent_eng).to be_visible

      consent_eng.decline_consent
      consent_eng.click_submit_consent

      expect(consent_eng).to have_consent_submitted_page
    end

    scenario 'reviews consent form' do
      participant_109.sign_in

      expect(consent_eng).to be_on_landing_page?

      participant_109.go_to('Review Consent')

      expect(consent_eng).to be_visible
    end

    scenario 'switches to Español when reviewing consent form' do
      participant_131.sign_in

      expect(consent_eng).to be_on_landing_page?
      participant_131.go_to('Review Consent')

      expect(consent_eng).to be_visible

      sleep(2)
      consent_eng.switch_language

      expect(consent_esp).to be_visible
    end

    scenario 'is a participant who did not give consent, can still use app' do
      participant_108.sign_in

      expect(consent_eng).to be_on_landing_page?
      participant_108.click_set_quit_date

      expect(participant_108).to have_quit_date_visible

      participant_108.go_to_root
      participant_108.click_stop_smoke_guide

      expect(participant_108).to have_smoke_guide_visible

      participant_108.go_to_root
      participant_108.click_cig_counter

      expect(participant_108).to have_cig_counter_visible

      participant_108.go_to_root
      participant_108.go_to('Review Consent')

      expect(consent_eng).to be_visible
    end
  end

  # Spanish

  context 'in Español' do
    scenario 'switches to English when consenting' do
      visit consent_esp.eligibility_page
      ptp_38_consent.find_age
      ptp_38_consent.set_age
      ptp_38_consent.answer_smoker
      ptp_38_consent.enter_sf_zip
      ptp_38_consent.answer_medical_care
      ptp_38_consent.enter_email
      ptp_38_consent.enter_phone_num
      ptp_38_consent.enter_password
      consent_esp.click_eligibility_submit
      consent_esp.click_view_consent

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      consent_esp.switch_language

      expect(consent_eng).to be_visible

      expect(consent_eng).to have_consent_response
    end

    scenario 'cannot review consent immediately' \
        'following ineligible decision' do
      visit consent_esp.ineligible_page

      expect(consent_esp).to have_no_consent_link
    end

    scenario 'completes eligibility, is eligible,' \
        'is able to consent immediately' do
      visit consent_esp.eligibility_page
      ptp_39_consent.find_age
      ptp_39_consent.set_age
      ptp_39_consent.answer_smoker
      ptp_39_consent.enter_sf_zip
      ptp_39_consent.answer_medical_care
      ptp_39_consent.enter_email
      ptp_39_consent.enter_phone_num
      ptp_39_consent.enter_password
      consent_esp.click_eligibility_submit
      consent_esp.click_view_consent

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      consent_esp.click_submit_consent

      expect(consent_esp).to have_consent_submitted_page
    end

    scenario 'switches to English while filling in eligibility, ' \
       'is eligible, sees consent form in English' do
      visit consent_esp.eligibility_page
      consent_esp.find_age
      consent_esp.set_age
      consent_esp.answer_smoker
      consent_esp.switch_language
      ptp_40_consent.find_age
      ptp_40_consent.enter_sf_zip
      ptp_40_consent.answer_medical_care
      ptp_40_consent.enter_email
      ptp_40_consent.enter_phone_num
      ptp_40_consent.enter_password
      consent_eng.click_eligibility_submit
      consent_eng.click_view_consent

      expect(consent_eng).to be_visible
    end

    scenario 'signs in and consents to participate' do
      participant_206.sign_in

      expect(consent_esp).to be_on_landing_page?

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      consent_esp.click_submit_consent

      expect(consent_esp).to have_consent_submitted_page
    end

    scenario 'signs in and does not consent to participate' do
      participant_207.sign_in

      expect(consent_esp).to be_on_landing_page?

      expect(consent_esp).to be_visible

      consent_esp.decline_consent
      consent_esp.click_submit_consent

      expect(consent_esp).to have_consent_submitted_page
    end

    scenario 'reviews consent form' do
      participant_209.sign_in

      expect(consent_esp).to be_on_landing_page?

      participant_209.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible
    end

    scenario 'switches to Español when reviewing consent form' do
      participant_231.sign_in

      expect(consent_esp).to be_on_landing_page?

      participant_231.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible

      sleep(2)
      consent_esp.switch_language

      expect(consent_esp).to be_visible
    end

    scenario 'is a participant who did not give consent, can still use app' do
      participant_208.sign_in

      expect(consent_esp).to be_on_landing_page?

      participant_208.click_set_quit_date

      expect(participant_208).to have_quit_date_visible

      participant_208.go_to_root
      participant_208.click_stop_smoke_guide

      expect(participant_208).to have_smoke_guide_visible

      participant_208.go_to_root
      participant_208.click_cig_counter

      expect(participant_208).to have_cig_counter_visible

      participant_208.go_to_root
      participant_208.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible
    end
  end
end
