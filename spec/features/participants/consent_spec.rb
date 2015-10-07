# filename: spec/features/participants/consent_spec.rb

describe 'A visitor to the site', type: :feature do
  context 'in English' do
    it 'can review consent immediately following eligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/en/pages/application#/en/eligibility-result?isEligible=true'
      click_on 'View the consent form'
      expect(page).to have_css('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
    end

    it 'cannot review consent immediately following ineligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/en/pages/application#/en/eligibility-result?isEligible=false'
      expect { click_on 'View the consent form' }.to raise_error
    end

    it 'completes eligibility, is eligible, is able to consent immediately' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '25'
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

      r = [ENV['Pt_15_Email'], ENV['Pt_15_Phone_Number'], ENV['Pt_15_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      click_on 'View the consent form'
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      expect(page).to have_css('h2', text: 'Stop Smoking App')
    end

    it 'signs in and consents to participate' do
      sign_in_pt_en(ENV['Pt_106_Email'], ENV['Pt_106_Password'])
      visit "#{ENV['Base_URL']}/#/en/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      expect(page).to have_css('h2', text: 'Stop Smoking App')
    end

    it 'signs in and does not consent to participate' do
      sign_in_pt_en(ENV['Pt_107_Email'], ENV['Pt_107_Password'])
      visit "#{ENV['Base_URL']}/#/en/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      click_on 'Submit'
      expect(page).to have_css('h2', text: 'Stop Smoking App')
    end

    it 'is able to review consent form' do
      sign_in_pt_en(ENV['Pt_109_Email'], ENV['Pt_109_Password'])
      click_on 'Review Consent'
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    it 'is a participant who did not give consent, can still use app' do
      sign_in_pt_en(ENV['Pt_108_Email'], ENV['Pt_108_Password'])
      # expect to be able to do something
    end
  end

  context 'in Español' do
    it 'can review consent immediately following eligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=true'
      click_on 'View the consent form'
      expect(page)
        .to have_css('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
    end

    it 'cannot review consent immediately following ineligible decision' do
      visit "#{ENV['Base_URL']}" \
            '/es/pages/application#/es/eligibility-result?isEligible=false'
      expect { click_on 'View the consent form' }.to raise_error
    end

    it 'completes eligibility, is eligible, is able to consent immediately' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
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

      r = [ENV['Pt_201_Email'], ENV['Pt_201_Phone_Number'],
           ENV['Pt_201_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      expect(page).to have_css('h2', text: 'Stop Smoking App')
    end

    it 'signs in and consents to participate' do
      sign_in_pt_es(ENV['Pt_206_Email'], ENV['Pt_206_Password'])
      visit "#{ENV['Base_URL']}/#/es/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      expect(page).to have_css('h2', text: 'Stop Smoking App')
    end

    it 'sign in and does not consent to participate' do
      sign_in_pt_es(ENV['Pt_207_Email'], ENV['Pt_207_Password'])
      visit "#{ENV['Base_URL']}/#/es/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      click_on 'Submit'
      expect(page).to have_css('h2', text: 'Stop Smoking App')
    end

    it 'is able to review consent form' do
      sign_in_pt_es(ENV['Pt_209_Email'], ENV['Pt_209_Password'])
      click_on 'Consentimiento Opinión'
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    it 'is a participant who did not give consent, can still use app' do
      sign_in_pt_es(ENV['Pt_208_Email'], ENV['Pt_208_Password'])
      # expect to be able to do something
    end
  end
end
