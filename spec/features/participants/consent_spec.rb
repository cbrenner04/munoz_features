# filename: spec/features/participants/consent_spec.rb

describe 'Participant signs in and navigates to the consent form',
         type: :feature do
  context 'in English' do
    it 'consents to participate' do
      sign_in_pt_en(ENV['Pt_106_Email'], ENV['Pt_106_Password'])
      visit "#{ENV['Base_URL']}/#/en/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      # expect(page).to have_content ''
    end

    it 'does not consent to participate' do
      sign_in_pt_en(ENV['Pt_107_Email'], ENV['Pt_107_Password'])
      visit "#{ENV['Base_URL']}/#/en/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      click_on 'Submit'
      # expect(page).to have_content ''
    end

    it 'is able to review consent form' do
      sign_in_pt_en(ENV['Pt_108_Email'], ENV['Pt_108_Password'])
      click_on 'Review Consent'
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT'
    end

    it 'is a participant who did not give consent, can still use app' do
      sign_in_pt_en(ENV['Pt_109_Email'], ENV['Pt_109_Password'])
      # expect to be able to do something
    end
  end

  context 'in Español' do
    it 'consents to participate' do
      sign_in_pt_es(ENV['Pt_206_Email'], ENV['Pt_206_Password'])
      visit "#{ENV['Base_URL']}/#/es/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      # expect(page).to have_content ''
    end

    it 'does not consent to participate' do
      sign_in_pt_es(ENV['Pt_207_Email'], ENV['Pt_207_Password'])
      visit "#{ENV['Base_URL']}/#/es/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      click_on 'Submit'
      # expect(page).to have_content ''
    end

    it 'is able to review consent form' do
      sign_in_pt_es(ENV['Pt_208_Email'], ENV['Pt_208_Password'])
      click_on 'Consentimiento Opinión'
      expect(page).to have_content 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    it 'is a participant who did not give consent, can still use app' do
      sign_in_pt_es(ENV['Pt_209_Email'], ENV['Pt_209_Password'])
      # expect to be able to do something
    end
  end
end
