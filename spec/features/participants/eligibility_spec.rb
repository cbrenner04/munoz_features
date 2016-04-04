# filename: spec/features/participants/eligibility_spec.rb

require './lib/zip_codes.rb'

feature 'A visitor to the site', metadata: :participant do
  context 'in English' do
    scenario 'navigates to the eligibility page' do
      eligibility_eng.go_to_root
      eligibility_eng.click_eng
      expect(page).to have_content 'Please answer the following questions to'
      eligibility_eng.click_con
      expect(page).to have_content 'How old are you?'
    end

    scenario 'switches to Español when filling out eligibility' do
      eligibility_eng.go_to_root
      eligibility_eng.click_eng
      eligibility_eng.click_con
      eligibility_eng.answer_smoker
      go_to('Español')
      eligibility_eng.find_age
      first('input[value = true]').should be_checked
    end

    scenario 'completes eligibility survey and is eligible' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker
      ptp_101_eligibility.enter_sf_zip
      ptp_101_eligibility.answer_medical_care
      ptp_101_eligibility.enter_email
      ptp_101_eligibility.enter_phone_num
      ptp_101_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_eligible

      expect(page).to have_content 'Thank you!  Please check your email to ' \
                                   'verify your account and continue.'
    end

    scenario 'completes eligibility survey and is ineligible due to age' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age

      first('input[type = tel]').set('17')

      eligibility_eng.answer_smoker
      ptp_102_eligibility.enter_sf_zip
      ptp_102_eligibility.answer_medical_care
      ptp_102_eligibility.enter_email
      ptp_102_eligibility.enter_phone_num
      ptp_102_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_ineligible
    end

    scenario 'completes eligibility survey, is ineligible due to neg response Q2' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25

      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(No Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      ptp_103_eligibility.enter_sf_zip
      ptp_103_eligibility.answer_medical_care
      ptp_103_eligibility.enter_email
      ptp_103_eligibility.enter_phone_num
      ptp_103_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_ineligible
    end

    scenario 'completes eligibility survey, is ineligible due to neg response Q3' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25

      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes No)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      ptp_104_eligibility.enter_sf_zip
      ptp_104_eligibility.answer_medical_care
      ptp_104_eligibility.enter_email
      ptp_104_eligibility.enter_phone_num
      ptp_104_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_ineligible
    end

    scenario 'does not fill in age, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.answer_smoker
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'fills in an age below the lower bound, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age

      first('input[type = tel]').set('0')

      eligibility_eng.answer_smoker
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'fills in an age above the upper bound, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age

      first('input[type = tel]').set('121')

      eligibility_eng.answer_smoker
      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in Q2, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25

      within('.form-group', text: 'Are you thinking of quitting') do
        choose 'Yes'
      end

      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in Q3, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25

      within('.form-group', text: 'Are you currently a smoker?') do
        choose 'Yes'
      end

      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care
      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_phone_num
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    # Not sure which participant profile to use
    scenario 'does not fill zip code, can submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker
      eligibility_eng.enter_email
      eligibility_eng.enter_phone_num
      eligibility_eng.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to be_eligible
    end

    scenario 'fills in a SF zip code, sees the drop down for selecting clinic' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker

      expect(page)
        .to_not have_content 'Where do you get most of your medical care?'

      eligibility_eng.enter_sf_zip

      expect(page)
        .to have_css('.form-group',
                     text: 'Where do you get most of your medical care?')
    end

    scenario 'fills in a zip other than SF, does not see the drop down for clinic' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker

      expect(page)
        .to_not have_content 'Where do you get most of your medical care?'
      all('input[type = tel]')[1].set(ZipCodes::CHI.sample)
      expect(page)
        .to_not have_content 'Where do you get most of your medical care?'
    end

    scenario 'does not fill in email, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker

      ptp_25_eligibility.enter_sf_zip
      ptp_25_eligibility.answer_medical_care

      ptp_25_eligibility.enter_phone_num
      ptp_25_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in phone number, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker

      ptp_9_eligibility.enter_sf_zip
      ptp_9_eligibility.answer_medical_care

      ptp_9_eligibility.enter_email
      ptp_9_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'does not fill in password, cannot submit form' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker
      ptp_25_eligibility.enter_sf_zip
      ptp_25_eligibility.answer_medical_care
      ptp_25_eligibility.enter_email
      ptp_25_eligibility.enter_password
      eligibility_eng.submit_disabled
    end

    scenario 'enters a duplicate email, sees error message' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker
      ptp_152_eligibility.enter_sf_zip
      ptp_152_eligibility.answer_medical_care
      ptp_151_eligibility.enter_email
      ptp_152_eligibility.enter_phone_num
      ptp_152_eligibility.enter_password
      eligibility_eng.click_submit

      expect(eligibility_eng).to have_error_message
    end

    scenario 'enters a duplicate phone number, sees error message' do
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker
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
      eligibility_eng.eligibility_page
      eligibility_eng.find_age
      eligibility_eng.set_age_25
      eligibility_eng.answer_smoker
      ptp_32_eligibility.enter_sf_zip
      ptp_32_eligibility.answer_medical_care
      ptp_32_eligibility.enter_email
      ptp_32_eligibility.enter_phone_num
      ptp_32_eligibility.enter_password
      eligibility_eng.click_submit
      click_on 'View the consent form'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      click_on 'Submit'
      expect(page).to have_css('iframe[class = ng-scope]')

      navigate_to('Cigarette Counter')
      expect(page).to have_content 'Yesterday'

      unless has_css?('.ng-binding', text: 'Stop Smoking Guide')
        find('.navbar-toggle').click
      end
      find('.ng-binding', text: 'Stop Smoking Guide').click
      expect(page).to have_css('a', text: 'Why Should I Quit?')

      sleep(2)
      go_to('Review Consent')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT TO ' \
                                   'PARTICIPATE IN A RESEARCH STUDY'
    end

    scenario 'sees invalid formatting in age field on eligibility form' do
      eligibility_eng.eligibility_page
      within('.form-group', text: 'How old are you?') do
        expect(page).to_not have_css('.ng-invalid-pattern')
        find('input[type = tel]').set('h')
        expect(page).to have_css('.ng-invalid-pattern')
      end
    end

    scenario 'sees invalid formatting in zip code field when entering less than 5 ' \
       'digits on eligibility form' do
      eligibility_eng.eligibility_page
      within('.form-group', text: 'What is your zip code?') do
        expect(page).to_not have_css('.ng-invalid-minlength')
        find('input[type = tel]').set('33')
        expect(page).to have_css('.ng-invalid-pattern')
        expect(page).to have_content 'Must be 5 digits to be valid.'
      end
    end

    scenario 'sees invalid formatting in zip code field when entering more than 5 ' \
       'digits on eligibility form' do
      eligibility_eng.eligibility_page
      within('.form-group', text: 'What is your zip code?') do
        expect(page).to_not have_css('.ng-invalid-minlength')
        find('input[type = tel]').set('333333333')
        expect(page).to have_css('.ng-invalid-pattern')
        expect(page).to have_content 'Must be 5 digits to be valid.'
      end
    end

    scenario 'sees invalid formatting in email field on eligibility form' do
      eligibility_eng.eligibility_page
      within('.form-group', text: 'Email') do
        expect(page).to_not have_css('.ng-invalid-email')
        find('input[type = email]').set('2')
        expect(page).to have_css('.ng-invalid-email')
        expect(page).to have_content 'Must be a valid email address.'
      end
    end

    scenario 'sees invalid formatting in phone number field on eligibility form' do
      eligibility_eng.eligibility_page
      within('.form-group', text: 'Phone Number') do
        expect(page).to_not have_css('.ng-invalid-pattern')
        find('input[type = tel]').set('33')
        expect(page).to have_css('.ng-invalid-pattern')
        expect(page).to have_content 'Must be 10 digits to be valid.'
      end
    end

    scenario 'sees invalid formatting in password field on eligibility form' do
      eligibility_eng.eligibility_page
      within('.form-group', text: 'Password') do
        expect(page).to_not have_css('.ng-invalid-minlength')
        find('input[type = password]').set('2')
        expect(page).to have_css('.ng-invalid-minlength')
        expect(page).to have_content 'minimum 8 characters'
      end
    end
  end

  # Spanish

  context 'in Español' do
    scenario 'navigates to the eligibilty page' do
      eligibility_esp.go_to_root
      click_on 'Español'
      expect(page)
        .to have_content 'Por favor responda las siguientes preguntas para ' \
                         'determinar si es elegible para participar.'
      click_on 'Continuar'
      expect(page).to have_content '¿Cuántos años tiene?'
    end

    scenario 'switches to English when filling out eligibility' do
      eligibility_esp.go_to_root
      click_on 'Español'
      click_on 'Continuar'
      within('.form-group', text: '¿Fuma usted actualmente?') do
        choose 'Sí'
      end

      go_to('English')
      eligibility_eng.find_age
      first('input[value = true]').should be_checked
    end

    scenario 'completes eligibility survey and is eligible' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      ptp_201_eligibility.enter_sf_zip
      ptp_201_eligibility.answer_medical_care

      ptp_201_eligibility.enter_email
      ptp_201_eligibility.enter_phone_num
      ptp_201_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_eligible

      expect(page).to have_content '¡Gracias! Por favor revise su correo ' \
                                   'electrónico para verificar su cuenta y ' \
                                   'continuar.'
    end

    scenario 'completes eligibility survey and is ineligible due to age' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      first('input[type = tel]').set('17')
      eligibility_esp.answer_smoker

      ptp_202_eligibility.enter_sf_zip
      ptp_202_eligibility.answer_medical_care

      ptp_202_eligibility.enter_email
      ptp_202_eligibility.enter_phone_num
      ptp_202_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_ineligible
    end

    scenario 'completes eligibility survey, is ineligible due to neg response Q2' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(No Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      ptp_203_eligibility.enter_sf_zip
      ptp_203_eligibility.answer_medical_care

      ptp_203_eligibility.enter_email
      ptp_203_eligibility.enter_phone_num
      ptp_203_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_ineligible
    end

    scenario 'completes eligibility survey, is ineligible due to neg response Q3' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí No)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      ptp_204_eligibility.enter_sf_zip
      ptp_204_eligibility.answer_medical_care

      ptp_204_eligibility.enter_email
      ptp_204_eligibility.enter_phone_num
      ptp_204_eligibility.enter_password
      eligibility_esp.click_submit

      expect(eligibility_esp).to be_ineligible
    end

    scenario 'does not fill in age, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.answer_smoker

      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care

      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'fills in an age below the lower bound, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      first('input[type = tel]').set('0')
      eligibility_esp.answer_smoker

      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care

      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'fills in an age above the upper bound, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      first('input[type = tel]').set('121')
      eligibility_esp.answer_smoker

      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care

      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in Q2, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      within('.form-group', text: '¿Está pensando en dejar de fumar dentro') do
        choose 'Sí'
      end

      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care

      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in Q3, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      within('.form-group', text: '¿Fuma usted actualmente?') do
        choose 'Sí'
      end

      ptp_10_eligibility.enter_sf_zip
      ptp_10_eligibility.answer_medical_care

      ptp_10_eligibility.enter_email
      ptp_10_eligibility.enter_phone_num
      ptp_10_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in zip code, can submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      eligibility_esp.enter_email
      eligibility_esp.enter_phone_num
      eligibility_esp.enter_password
      eligibility_esp.click_submit
      expect(page).to have_content 'Usted es eligible para participar en ' \
                                   'nuestro estudio'
    end

    scenario 'fills in a SF zip code, sees the drop down for selecting a clinic' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      expect(page)
        .to_not have_content '¿Dónde recibe la mayor parte de su atención médic'
      eligibility_esp.enter_sf_zip
      expect(page)
        .to have_css('.form-group',
                     text: '¿Dónde recibe la mayor parte de su atención médica')
    end

    scenario 'fills in a zip code other than SF, does not see drop down for clinic' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      expect(page)
        .to_not have_content '¿Dónde recibe la mayor parte de su atención médic'
      all('input[type = tel]')[1].set(ZipCodes::CHI.sample)
      expect(page)
        .to_not have_content '¿Dónde recibe la mayor parte de su atención médic'
    end

    scenario 'does not fill in email, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      ptp_26_eligibility.enter_sf_zip
      ptp_26_eligibility.answer_medical_care

      ptp_26_eligibility.enter_phone_num
      ptp_26_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in phone number, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      ptp_26_eligibility.enter_sf_zip
      ptp_26_eligibility.answer_medical_care

      ptp_26_eligibility.enter_email
      ptp_26_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'does not fill in password, cannot submit form' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      ptp_26_eligibility.enter_sf_zip
      ptp_26_eligibility.answer_medical_care

      ptp_26_eligibility.enter_email
      ptp_26_eligibility.enter_password
      eligibility_esp.submit_disabled
    end

    scenario 'enters duplicate email, sees error message' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      ptp_252_eligibility.enter_sf_zip
      ptp_252_eligibility.answer_medical_care

      ptp_251_eligibility.enter_email
      ptp_252_eligibility.enter_phone_num
      ptp_252_eligibility.enter_password
      eligibility_esp.click_submit
      expect(eligibility_esp).to have_error_message
    end

    scenario 'enters duplicate phone number, sees error message' do
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

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
      eligibility_esp.eligibility_page
      eligibility_esp.find_age
      eligibility_esp.set_age_25
      eligibility_esp.answer_smoker

      ptp_34_eligibility.enter_sf_zip
      ptp_34_eligibility.answer_medical_care

      ptp_34_eligibility.enter_email
      ptp_34_eligibility.enter_phone_num
      ptp_34_eligibility.enter_password
      eligibility_esp.click_submit
      click_on 'Ver el formulario de consentimiento'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      click_on 'Enviar'
      expect(page).to have_css('iframe[class = ng-scope]')

      navigate_to('Guía Para Dejar de Fumar')
      expect(page).to have_css('a', text: '¿Por qué debo dejar de fumar?')

      navigate_to('Contador de Cigarrillos')
      expect(page).to have_content 'Ayer'

      sleep(2)
      go_to('Revise el Consentimiento')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    scenario 'sees invalid formatting in age field on eligibility form' do
      eligibility_esp.eligibility_page
      within('.form-group', text: '¿Cuántos años tiene?') do
        expect(page).to_not have_css('.ng-invalid-pattern')
        find('input[type = tel]').set('h')
        expect(page).to have_css('.ng-invalid-pattern')
      end
    end

    scenario 'sees invalid formatting in zip code field when entering less than 5 ' \
       'digits on eligibility form' do
      eligibility_esp.eligibility_page
      within('.form-group', text: '¿Cuál es su código postal?') do
        expect(page).to_not have_css('.ng-invalid-minlength')
        find('input[type = tel]').set('33')
        expect(page).to have_css('.ng-invalid-pattern')
        expect(page).to have_content 'Debe introducir 5 dígitos para ser válido'
      end
    end

    scenario 'sees invalid formatting in zip code field when entering more than 5 ' \
       'digits on eligibility form' do
      eligibility_esp.eligibility_page
      within('.form-group', text: '¿Cuál es su código postal?') do
        expect(page).to_not have_css('.ng-invalid-minlength')
        find('input[type = tel]').set('33333333')
        expect(page).to have_css('.ng-invalid-pattern')
        expect(page).to have_content 'Debe introducir 5 dígitos para ser válido'
      end
    end

    scenario 'sees invalid formatting in email field on eligibility form' do
      eligibility_esp.eligibility_page
      within('.form-group', text: 'Email') do
        expect(page).to_not have_css('.ng-invalid-email')
        find('input[type = email]').set('2')
        expect(page).to have_css('.ng-invalid-email')
        expect(page)
          .to have_content 'Debe introducir un correo electrónico válido'
      end
    end

    scenario 'sees invalid formatting in phone number field on eligibility form' do
      eligibility_esp.eligibility_page
      within('.form-group', text: 'Teléfono') do
        expect(page).to_not have_css('.ng-invalid-pattern')
        find('input[type = tel]').set('33')
        expect(page).to have_css('.ng-invalid-pattern')
        expect(page)
          .to have_content 'Debe introducir 10 dígitos para ser válido'
      end
    end

    scenario 'sees invalid formatting in password field on eligibility form' do
      eligibility_esp.eligibility_page
      within('.form-group', text: 'Contraseña') do
        expect(page).to_not have_css('.ng-invalid-minlength')
        find('input[type = password]').set('2')
        expect(page).to have_css('.ng-invalid-minlength')
        expect(page).to have_content 'mínimo 8 caracteres'
      end
    end
  end
end
