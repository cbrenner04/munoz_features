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

      consent_eng.give_consent_check
      consent_eng.switch_lang_btn

      expect(consent_esp).to be_visible

      expect(consent_esp).to have_consent_response
    end

    scenario 'cannot review consent immediately following ineligible decision' do
      visit consent_eng.ineligible_page

      expect(consent_eng).to have_no_view_link
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

      consent_eng.give_consent_check
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
      visit ENV['Base_URL']
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_106_Email']
      fill_in 'participant_password', with: ENV['Pt_106_Password']
      click_on 'Sign in'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-invalid-required').click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'signs in and does not consent to participate' do
      visit ENV['Base_URL']
      unless has_css?('a', text: 'Sign in')
        find('.navbar-toggle').click
        find('.dropdown-toggle').click
        has_text?('Sign out')
        click_on 'Sign out'
      end
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_107_Email']
      fill_in 'participant_password', with: ENV['Pt_107_Password']
      click_on 'Sign in'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      all('.ng-invalid')[1].click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'reviews consent form' do
      sign_in_pt_en('109')
      go_to('Review Consent')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    scenario 'switches to Español when reviewing consent form' do
      sign_in_pt_en('131')
      go_to('Review Consent')
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      sleep(2)
      go_to('Español')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    scenario 'is a participant who did not give consent, can still use app' do
      sign_in_pt_en('108')
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
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end
  end



  # Spanish



  context 'in Español' do
    scenario 'switches to English when consenting' do
      visit consent_esp.eligibility_page

      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_38_Email'])
      all('input[type = tel]')[2].set(ENV['Pt_38_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_38_Password'])
      find('input[type = submit]').click
      click_on 'Ver el formulario de consentimiento'

      expect(consent_esp).to be_visible
      
      first('.ng-invalid-required').click
      go_to('English')

      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'

      find('input[value = true]').should be_checked
    end

    scenario 'cannot review consent immediately following ineligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=false'
      expect(page)
        .to_not have_css('a', text: 'Ver el formulario de consentimiento')
    end

    scenario 'completes eligibility, is eligible, is able to consent immediately' do
      visit consent_esp.eligibility_page

      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_39_Email'])
      all('input[type = tel]')[2].set(ENV['Pt_39_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_39_Password'])
      find('input[type = submit]').click
      click_on 'Ver el formulario de consentimiento'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-invalid-required').click
      click_on 'Enviar'
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'switches to English while filling in eligibility, ' \
       'is eligible, sees consent form in English' do
      vvisit consent_esp.eligibility_page

      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      go_to('English')
      find('.ng-binding', text: 'How old are you?')
      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_40_Email'])
      all('input[type = tel]')[2].set(ENV['Pt_40_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_40_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
    end

    scenario 'signs in and consents to participate' do
      visit ENV['Base_URL']
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: ENV['Pt_206_Email']
      fill_in 'participant_password', with: ENV['Pt_206_Password']
      click_on 'Iniciar sesión'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-invalid-required').click
      find('.btn.btn-primary', text: 'Enviar').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'signs in and does not consent to participate' do
      visit ENV['Base_URL']
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: ENV['Pt_207_Email']
      fill_in 'participant_password', with: ENV['Pt_207_Password']
      click_on 'Iniciar sesión'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      all('.ng-invalid')[1].click
      find('.btn.btn-primary', text: 'Enviar').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    scenario 'reviews consent form' do
      sign_in_pt_es('209')
      go_to('Revise el Consentimiento')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    scenario 'switches to English when reviewing the consent form' do
      sign_in_pt_es('231')
      go_to('Revise el Consentimiento')
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      sleep(2)
      go_to('English')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    scenario 'is a participant who did not give consent, can still use app' do
      sign_in_pt_es('208')
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
