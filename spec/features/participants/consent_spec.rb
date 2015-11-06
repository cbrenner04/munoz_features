# filename: spec/features/participants/consent_spec.rb

require_relative '../../../lib/zip_codes.rb'

describe 'A visitor to the site', type: :feature, metadata: :participant do
  context 'in English' do
    it 'switches to Español when consenting' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      a = ['Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_27_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_27_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_27_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      go_to('Español')

      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
      find('input[value = true]').should be_checked
    end

    it 'cannot review consent immediately following ineligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/en/pages/application#/en/eligibility-result?isEligible=false'
      expect { click_on 'View the consent form' }.to raise_error
    end

    it 'completes eligibility, is eligible, is able to consent immediately' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      a = ['Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_15_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_15_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_15_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      click_on 'Submit'
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    it 'switches to Español while filling in eligibility, ' \
       'is eligible, sees consent form in Español' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      a = ['Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      go_to('Español')
      find('.ng-binding', text: '¿Cuántos años tiene?')
      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_23_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_23_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_23_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form' # need to update with Spanish
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
    end

    it 'signs in and consents to participate' do
      visit ENV['Base_URL']
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_106_Email']
      fill_in 'participant_password', with: ENV['Pt_106_Password']
      click_on 'Sign in'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    it 'signs in and does not consent to participate' do
      visit ENV['Base_URL']
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_107_Email']
      fill_in 'participant_password', with: ENV['Pt_107_Password']
      click_on 'Sign in'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      page.all('.ng-pristine.ng-untouched.ng-invalid')[1].click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    it 'reviews consent form' do
      sign_in_pt_en('109')
      go_to('Review Consent')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    it 'switches to Español when reviewing consent form' do
      sign_in_pt_en('131')
      go_to('Review Consent')
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      sleep(2)
      go_to('Español')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    it 'is a participant who did not give consent, can still use app' do
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

  context 'in Español' do
    it 'switches to English when consenting' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      a = ['Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_28_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_28_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_28_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      go_to('English')

      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'

      find('input[value = true]').should be_checked
    end

    it 'cannot review consent immediately following ineligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=false'
      expect { click_on 'View the consent form' }.to raise_error # need to update with Spanish
    end

    it 'completes eligibility, is eligible, is able to consent immediately' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      a = ['Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_201_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_201_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_201_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form' # need to update with Spanish
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      click_on 'Enviar'
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    it 'switches to English while filling in eligibility, ' \
       'is eligible, sees consent form in English' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      a = ['Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      go_to('English')
      find('.ng-binding', text: 'How old are you?')
      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_24_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_24_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_24_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
    end

    it 'signs in and consents to participate' do
      visit ENV['Base_URL']
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: ENV['Pt_206_Email']
      fill_in 'participant_password', with: ENV['Pt_206_Password']
      click_on 'Iniciar sesión'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      find('.btn.btn-primary', text: 'Enviar').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    it 'signs in and does not consent to participate' do
      visit ENV['Base_URL']
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: ENV['Pt_207_Email']
      fill_in 'participant_password', with: ENV['Pt_207_Password']
      click_on 'Iniciar sesión'
      find('h3', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      page.all('.ng-pristine.ng-untouched.ng-invalid')[1].click
      find('.btn.btn-primary', text: 'Enviar').click
      expect(page).to have_css('iframe[class = ng-scope]')
    end

    it 'reviews consent form' do
      sign_in_pt_es('209')
      go_to('Revise el Consentimiento')
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    it 'switches to English when reviewing the consent form' do
      sign_in_pt_es('231')
      go_to('Revise el Consentimiento')
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      sleep(2)
      go_to('English')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    it 'is a participant who did not give consent, can still use app' do
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
