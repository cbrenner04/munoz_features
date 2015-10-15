# filename: spec/features/participants/consent_spec.rb

describe 'A visitor to the site', type: :feature, metadata: :participant do
  context 'in English' do
    it 'reviews consent immediately following eligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/en/pages/application#/en/eligibility-result?isEligible=true'
      click_on 'View the consent form'
      expect(page).to have_css('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
    end

    it 'switches to Español when consenting' do
      visit "#{ENV['Base_URL']}" \
            '/en/pages/application#/en/eligibility-result?isEligible=true'
      click_on 'View the consent form'
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      navigate_to('Español')

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
      find('input[type = number]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?',
           'Do you currently live in California?']
      a = ['Yes', 'Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      i = ['email', 'tel', 'password']
      r = [ENV['Pt_15_Email'], ENV['Pt_15_Phone_Number'], ENV['Pt_15_Password']]

      i.zip(r).each do |item, response|
        find("input[type = #{item}]").set(response)
      end

      click_on 'Submit'
      click_on 'View the consent form'
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      expect(page).to have_css('a', text: 'Review Consent')
    end

    it 'switches to Español while filling in eligibility, ' \
       'is eligible, sees consent form in Español' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      find('input[type = number]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?',
           'Do you currently live in California?']
      a = ['Yes', 'Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      navigate_to('Español')

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      i = ['email', 'tel', 'password']
      r = [ENV['Pt_23_Email'], ENV['Pt_23_Phone_Number'], ENV['Pt_23_Password']]

      i.zip(r).each do |item, response|
        find("input[type = #{item}]").set(response)
      end

      click_on 'Submit'
      click_on 'View the consent form' # need to update with Spanish
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
    end

    it 'signs in and consents to participate' do
      sign_in_pt_en('106')
      visit "#{ENV['Base_URL']}/#/en/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      find('.btn.btn-default', text: 'Submit')
      expect(page).to have_css('a', text: 'Review Consent')
    end

    it 'signs in and does not consent to participate' do
      sign_in_pt_en('107')
      visit "#{ENV['Base_URL']}/#/en/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      find('.btn.btn-default', text: 'Submit')
      expect(page).to have_css('a', text: 'Review Consent')
    end

    it 'reviews consent form' do
      sign_in_pt_en('109')
      click_on 'Review Consent'
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    it 'switches to Español when reviewing consent form' do
      sign_in_pt_en('131')
      click_on 'Review Consent'
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      navigate_to('Español')
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
      click_on 'Review Consent'
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end
  end

  context 'in Español' do
    it 'reviews consent immediately following eligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=true'
      click_on 'View the consent form'
      expect(page)
        .to have_css('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
    end

    it 'switches to English when consenting' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=true'
      click_on 'View the consent form'
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      navigate_to('English')

      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'

      find('input[value = true]').should be_checked
    end

    it 'cannot review consent immediately following ineligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=false'
      expect { click_on 'View the consent form' }.to raise_error
    end

    it 'completes eligibility, is eligible, is able to consent immediately' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      find('input[type = number]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
           '¿Actualmente vive en California?']
      a = ['Sí', 'Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      i = ['email', 'tel', 'password']
      r = [ENV['Pt_201_Email'], ENV['Pt_201_Phone_Number'],
           ENV['Pt_201_Password']]

      i.zip(r).each do |item, response|
        find("input[type = #{item}]").set(response)
      end

      click_on 'Submit'
      click_on 'View the consent form'
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      expect(page).to have_css('a', text: 'Review Consent')
    end

    it 'switches to English while filling in eligibility, ' \
       'is eligible, sees consent form in English' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      find('input[type = number]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
           '¿Actualmente vive en California?']
      a = ['Sí', 'Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      navigate_to('English')

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      i = ['email', 'tel', 'password']
      r = [ENV['Pt_24_Email'], ENV['Pt_24_Phone_Number'], ENV['Pt_24_Password']]

      i.zip(r).each do |item, response|
        find("input[type = #{item}]").set(response)
      end

      click_on 'Submit'
      click_on 'View the consent form' # need to update with Spanish
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
    end

    it 'signs in and consents to participate' do
      sign_in_pt_es('206')
      visit "#{ENV['Base_URL']}/#/es/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      find('.btn.btn-default', text: 'Submit')
      expect(page).to have_css('a', text: 'Review Consent')
    end

    it 'signs in and does not consent to participate' do
      sign_in_pt_es('207')
      visit "#{ENV['Base_URL']}/#/es/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      find('.btn.btn-default', text: 'Submit')
      expect(page).to have_css('a', text: 'Review Consent')
    end

    it 'reviews consent form' do
      sign_in_pt_es('209')
      click_on 'Review Consent' # need to update with Spanish
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    it 'switches to English when reviewing the consent form' do
      sign_in_pt_es('231')
      click_on 'Review Consent' # need to update with Spanish
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      navigate_to('English')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    it 'is a participant who did not give consent, can still use app' do
      sign_in_pt_es('208')
      click_on 'Set Your Quit Date' # need to update with Spanish
      expect(page).to have_css('.ng-binding.ng-scope', text: 'Mi')

      visit "#{ENV['Base_URL']}"
      click_on 'Stop Smoking Guide' # need to update with Spanish
      expect(page).to have_css('a', text: 'Why Should I Quit?') # need to update with Spanish

      visit "#{ENV['Base_URL']}"
      click_on 'Cigarette Counter' # need to update with Spanish
      expect(page).to have_content 'Ayer'

      visit "#{ENV['Base_URL']}"
      click_on 'Review Consent' # need to update with Spanish
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end
  end
end
