# filename: spec/features/participants/eligibility_spec.rb

require './lib/zip_codes.rb'
require './spec/support/participants/eligibility_helper'
require './spec/support/participants_helper'

feature 'A visitor to the site', metadata: :participant do
  context 'in English' do
    scenario 'navigates to the eligibility page' do
      participant_gen_eng.go_to_root
      eligibility_eng.click_eng

      expect(eligibility_eng).to have_questions

      eligibility_eng.click_con

      expect(eligibility_eng).to be_visible
    end

    scenario 'switches to Español when filling out eligibility' do
      participant_gen_eng.go_to_root
      eligibility_eng.click_eng
      eligibility_eng.click_con
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      participant_gen_eng.go_to('Español')
      eligibility_esp.find_age

      expect(eligibility_esp).to be_still_checked
    end

    scenario 'completes eligibility survey and is eligible' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_101_eligibility.enter_sf_zip
      ptp_101_eligibility.answer_medical_care
      ptp_101_eligibility.enter_email
      ptp_101_eligibility.enter_phone_num
      ptp_101_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_eligible

      expect(eligibility_eng).to have_account_verify
    end

    scenario 'completes eligibility survey and is ineligible due to age' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      ptp_102_elg_age_17.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_102_eligibility.enter_sf_zip
      ptp_102_eligibility.answer_medical_care
      ptp_102_eligibility.enter_email
      ptp_102_eligibility.enter_phone_num
      ptp_102_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_ineligible
    end

    scenario 'completes eligibility survey, ' \
        'is ineligible due to neg response Q2' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      ptp_103_eligibility.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_103_eligibility.enter_sf_zip
      ptp_103_eligibility.answer_medical_care
      ptp_103_eligibility.enter_email
      ptp_103_eligibility.enter_phone_num
      ptp_103_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_ineligible
    end

    scenario 'completes eligibility survey, ' \
        'is ineligible due to neg response Q3' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      ptp_104_eligibility.answer_thinking_of_quitting
      ptp_104_eligibility.enter_sf_zip
      ptp_104_eligibility.answer_medical_care
      ptp_104_eligibility.enter_email
      ptp_104_eligibility.enter_phone_num
      ptp_104_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_ineligible
    end

    scenario 'does not fill in age, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'fills in an age below the lower bound, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      ptp_9_elg_age_0.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'fills in an age above the upper bound, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      ptp_9_elg_age_121.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in Q2, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_thinking_of_quitting
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in Q3, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill zip code, can submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_31_eligibility.enter_email
      ptp_31_eligibility.enter_phone_num
      ptp_31_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_eligible
    end

    scenario 'fills in a SF zip code, ' \
        'sees the drop down for selecting clinic' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting

      expect(eligibility_eng).to have_no_medical_question

      eligibility_eng.enter_sf_zip

      expect(eligibility_eng).to have_medical_question
    end

    scenario 'fills in a zip other than SF, ' \
        'does not see the drop down for clinic' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting

      expect(eligibility_eng).to have_no_medical_question

      eligibility_eng.enter_chi_zip

      expect(eligibility_eng).to have_no_medical_question
    end

    scenario 'does not fill in email, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_25_eligibility.enter_sf_zip
      ptp_25_eligibility.answer_medical_care
      ptp_25_eligibility.enter_phone_num
      ptp_25_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in phone number, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in password, cannot submit form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_25_eligibility.enter_sf_zip
      ptp_25_eligibility.answer_medical_care
      ptp_25_eligibility.enter_email
      ptp_25_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'enters a duplicate email, sees error message' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_152_eligibility.enter_sf_zip
      ptp_152_eligibility.answer_medical_care
      ptp_151_eligibility.enter_email
      ptp_152_eligibility.enter_phone_num
      ptp_152_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to have_error_message
    end

    scenario 'enters a duplicate phone number, sees error message' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_152_eligibility.enter_sf_zip
      ptp_152_eligibility.answer_medical_care
      ptp_152_eligibility.enter_email
      ptp_151_eligibility.enter_phone_num
      ptp_152_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to have_error_message
    end

    scenario 'fills out eligibility, is eligible, consents, ' \
        'can still use app with unconfirmed email' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age
      eligibility_eng.answer_current_smoker
      eligibility_eng.answer_thinking_of_quitting
      ptp_32_eligibility.enter_sf_zip
      ptp_32_eligibility.answer_medical_care
      ptp_32_eligibility.enter_email
      ptp_32_eligibility.enter_phone_num
      ptp_32_eligibility.enter_password
      eligibility_eng.click_submit
      eligibility_eng.click_view_consent

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.click_submit

      expect(consent_eng).to be_submitted

      participant_32.navigate_to('Cigarette Counter')

      expect(cigarette_counter_eng).to be_visible

      participant_32.navigate_to('Stop Smoking Guide')

      expect(stop_smoking_guide_eng).to be_visible

      sleep(2)
      participant_32.go_to('Review Consent')

      expect(consent_eng).to be_visible
    end

    scenario 'sees invalid formatting in age field on eligibility form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.invalid_age
    end

    scenario 'sees invalid formatting in zip code field ' \
        'when entering less than 5 ' \
        'digits on eligibility form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.less_than_5_zip
    end

    scenario 'sees invalid formatting in zip code ' \
        'field when entering more than 5 ' \
        'digits on eligibility form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.more_than_5_zip
    end

    scenario 'sees invalid formatting in email field on eligibility form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.invalid_email
    end

    scenario 'sees invalid formatting in phone number field ' \
        'on eligibility form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.invalid_phone
    end

    scenario 'sees invalid formatting in password field on eligibility form' do
      visit eligibility_eng.eligibility_page
      eligibility_eng.invalid_password
    end
  end

  # Spanish

  context 'in Español' do
    scenario 'navigates to the eligibilty page' do
      participant_gen_esp.go_to_root
      eligibility_esp.click_esp

      expect(eligibility_esp).to have_questions

      eligibility_esp.click_con
      expect(eligibility_esp).to be_visible
    end

    scenario 'switches to English when filling out eligibility' do
      participant_gen_esp.go_to_root
      eligibility_esp.click_esp
      eligibility_esp.click_con
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      participant_gen_esp.go_to('English')
      eligibility_eng.find_age

      expect(eligibility_eng).to be_still_checked
    end

    scenario 'completes eligibility survey and is eligible' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_201_eligibility.enter_sf_zip
      ptp_201_eligibility.answer_medical_care
      ptp_201_eligibility.enter_email
      ptp_201_eligibility.enter_phone_num
      ptp_201_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_eligible

      expect(eligibility_esp).to have_account_verify
    end

    scenario 'completes eligibility survey and is ineligible due to age' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      ptp_202_elg_age_17.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_202_eligibility.enter_sf_zip
      ptp_202_eligibility.answer_medical_care
      ptp_202_eligibility.enter_email
      ptp_202_eligibility.enter_phone_num
      ptp_202_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_ineligible
    end

    scenario 'completes eligibility survey, ' \
        'is ineligible due to neg response Q2' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      ptp_203_eligibility.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_203_eligibility.enter_sf_zip
      ptp_203_eligibility.answer_medical_care
      ptp_203_eligibility.enter_email
      ptp_203_eligibility.enter_phone_num
      ptp_203_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_ineligible
    end

    scenario 'completes eligibility survey, ' \
        'is ineligible due to neg response Q3' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      ptp_204_eligibility.answer_thinking_of_quitting
      ptp_204_eligibility.enter_sf_zip
      ptp_204_eligibility.answer_medical_care
      ptp_204_eligibility.enter_email
      ptp_204_eligibility.enter_phone_num
      ptp_204_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_ineligible
    end

    scenario 'does not fill in age, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting

      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care

      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'fills in an age below the lower bound, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      ptp_10_elg_age_0.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care
      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'fills in an age above the upper bound, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      ptp_10_elg_age_121.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care
      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in Q2, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_thinking_of_quitting
      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care
      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in Q3, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care
      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in zip code, can submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_33_eligibility.enter_email
      ptp_33_eligibility.enter_phone_num
      ptp_33_eligibility.enter_password
      ptp_33_eligibility.click_submit
      expect(eligibility_esp).to be_eligible
    end

    scenario 'fills in a SF zip code, ' \
        'sees the drop down for selecting a clinic' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting

      expect(eligibility_esp).to have_no_medical_question

      eligibility_esp.enter_sf_zip

      expect(eligibility_esp).to have_medical_question
    end

    scenario 'fills in a zip code other than SF, ' \
        'does not see drop down for clinic' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting

      expect(eligibility_esp).to have_no_medical_question

      eligibility_esp.enter_chi_zip

      expect(eligibility_esp).to have_no_medical_question
    end

    scenario 'does not fill in email, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_26_eligibility.enter_sf_zip
      ptp_26_eligibility.answer_medical_care
      ptp_26_eligibility.enter_phone_num
      ptp_26_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in phone number, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_26_eligibility.enter_sf_zip
      ptp_26_eligibility.answer_medical_care
      ptp_26_eligibility.enter_email
      ptp_26_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in password, cannot submit form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_26_eligibility.enter_sf_zip
      ptp_26_eligibility.answer_medical_care
      ptp_26_eligibility.enter_email
      ptp_26_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'enters duplicate email, sees error message' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_252_eligibility.enter_sf_zip
      ptp_252_eligibility.answer_medical_care
      ptp_251_eligibility.enter_email
      ptp_252_eligibility.enter_phone_num
      ptp_252_eligibility.enter_password
      eligibility_esp.click_submit
      expect(eligibility_esp).to have_error_message
    end

    scenario 'enters duplicate phone number, sees error message' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_252_eligibility.enter_sf_zip
      ptp_252_eligibility.answer_medical_care
      ptp_252_eligibility.enter_email
      ptp_251_eligibility.enter_phone_num
      ptp_252_eligibility.enter_password
      eligibility_esp.click_submit
      expect(eligibility_esp).to have_error_message
    end

    scenario 'fills out eligibility, is eligible, consents,' \
       'is able to use the app with unconfirmed email' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age
      eligibility_esp.answer_current_smoker
      eligibility_esp.answer_thinking_of_quitting
      ptp_34_eligibility.enter_sf_zip
      ptp_34_eligibility.answer_medical_care
      ptp_34_eligibility.enter_email
      ptp_34_eligibility.enter_phone_num
      ptp_34_eligibility.enter_password
      eligibility_esp.click_submit
      eligibility_esp.click_view_consent

      expect(consent_esp).to be_visible

      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      consent_esp.click_submit

      expect(consent_esp).to be_submitted

      participant_34.navigate_to('Guía Para Dejar de Fumar')

      expect(stop_smoking_guide_esp).to be_visible

      participant_34.navigate_to('Contador de Cigarrillos')

      expect(cigarette_counter_esp).to be_visible

      sleep(2)
      participant_34.go_to('Revise el Consentimiento')

      expect(consent_esp).to be_visible
    end

    scenario 'sees invalid formatting in age field on eligibility form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.invalid_age
    end

    scenario 'sees invalid formatting in zip code ' \
        'field when entering less than 5 ' \
        'digits on eligibility form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.less_than_5_zip
    end

    scenario 'sees invalid formatting in zip code ' \
        'field when entering more than 5 ' \
        'digits on eligibility form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.more_than_5_zip
    end

    scenario 'sees invalid formatting in email field on eligibility form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.invalid_email
    end

    scenario 'sees invalid formatting in phone ' \
        'number field on eligibility form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.invalid_phone
    end

    scenario 'sees invalid formatting in password field on eligibility form' do
      visit eligibility_esp.eligibility_page
      eligibility_esp.invalid_password
    end
  end
end
