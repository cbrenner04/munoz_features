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
      ptp_35_consent.enter_phone
      ptp_35_consent.enter_password
      consent_eng.click_eligibility_submit
      consent_eng.click_view_consent

      expect(consent_eng).to be_visible

      consent_eng.give_consent
      consent_eng.switch_lang_btn

      expect(consent_esp).to be_visible

      expect(consent_esp).to have_consent_response
    end

    scenario 'cannot review consent immediately following ineligible decision' do
      visit consent_eng.ineligible_page

      expect(consent_eng).to have_no_consent_link
    end

    scenario 'completes eligibility, is eligible, is able to consent immediately' do
      visit consent_eng.eligibility_page
      ptp_36_consent.find_age
      ptp_36_consent.set_age
      ptp_36_consent.answer_smoker
      ptp_36_consent.enter_sf_zip
      ptp_36_consent.answer_medical_care
      ptp_36_consent.enter_email
      ptp_36_consent.enter_phone
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
      consent_eng.switch_lang_btn
      ptp_37_consent.find_age
      ptp_37_consent.enter_sf_zip
      ptp_37_consent.answer_medical_care
      ptp_37_consent.enter_email
      ptp_37_consent.enter_phone
      ptp_37_consent.enter_password
      consent_esp.click_eligibility_submit
      consent_esp.click_view_consent
      
      expect(consent_esp).to be_visible
    end

    scenario 'signs in and consents to participate' do
      participant_106.sign_in

      expect(consent_eng).to be_visible

      first('.ng-invalid-required').click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'signs in and does not consent to participate' do
      participant_107.sign_in
      
      expect(consent_eng).to be_visible
      
      all('.ng-invalid')[1].click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'reviews consent form' do
      participant_109.sign_in
      go_to('Review Consent')

      expect(consent_eng).to be_visible
    end

    scenario 'switches to Español when reviewing consent form' do
      participant_131.sign_in
      go_to('Review Consent')
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      sleep(2)
      go_to('Español')
      
      expect(consent_esp).to be_visible
    end

    scenario 'is a participant who did not give consent, can still use app' do
      participant_108.sign_in
      click_on 'Set Your Quit Date'
      expect(page).to have_css('.ng-binding.ng-scope', text: 'We')

      visit ENV['Base_URL']
      click_on 'Stop Smoking Guide'
      expect(page).to have_css('a', text: 'Why Should I Quit?')

      visit ENV['Base_URL']
      click_on 'Cigarette Counter'
      expect(page).to have_content 'Yesterday'

      visit ENV['Base_URL']
      go_to('Review Consent')
      
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
      ptp_38_consent.enter_phone
      ptp_38_consent.enter_password
      consent_esp.click_eligibility_submit
      consent_esp.click_view_consent

      expect(consent_esp).to be_visible

      consent_esp.give_consent
      consent_esp.switch_lang_btn

      expect(consent_eng).to be_visible

      expect(consent_eng).to have_consent_response
    end

    scenario 'cannot review consent immediately following ineligible decision' do
      visit consent_esp.ineligible_page

      expect(consent_esp).to have_no_consent_link
    end

    scenario 'completes eligibility, is eligible, is able to consent immediately' do
      visit consent_esp.eligibility_page
      ptp_39_consent.find_age
      ptp_39_consent.set_age
      ptp_39_consent.answer_smoker
      ptp_39_consent.enter_sf_zip
      ptp_39_consent.answer_medical_care
      ptp_39_consent.enter_email
      ptp_39_consent.enter_phone
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
      vvisit consent_esp.eligibility_page
      consent_esp.find_age
      consent_esp.set_age
      consent_esp.answer_smoker
      consent_esp.switch_lang_btn
      ptp_40_consent.find_age
      ptp_40_consent.enter_sf_zip
      ptp_40_consent.answer_medical_care
      ptp_40_consent.enter_email
      ptp_40_consent.enter_phone
      ptp_40_consent.enter_password
      consent_eng.click_eligibility_submit
      consent_eng.click_view_consent
      
      expect(consent_eng).to be_visible
    end

    scenario 'signs in and consents to participate' do
      participant_206.sign_in
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-invalid-required').click
      find('.btn.btn-primary', text: 'Enviar').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'signs in and does not consent to participate' do
      participant_207.sign_in
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      all('.ng-invalid')[1].click
      find('.btn.btn-primary', text: 'Enviar').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'reviews consent form' do
      participant_209.sign_in
      go_to('Revise el Consentimiento')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    scenario 'switches to English when reviewing the consent form' do
      participant_231.sign_in
      go_to('Revise el Consentimiento')
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      sleep(2)
      go_to('English')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    scenario 'is a participant who did not give consent, can still use app' do
      participant_208.sign_in
      click_on 'Elija la fecha en que dejará de fumar'
      expect(page).to have_css('.ng-binding.ng-scope', text: 'Mi')

      visit "#{ENV['Base_URL']}"
      click_on 'Guía Para Dejar de Fumar'
      expect(page).to have_css('a', text: '¿Por qué debo dejar de fumar?')

      visit "#{ENV['Base_URL']}"
      click_on 'Contador de Cigarrillos'
      expect(page).to have_content 'Ayer'

      visit "#{ENV['Base_URL']}"
      go_to('Revise el Consentimiento')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end
  end
end
