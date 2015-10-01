# filename: spec/features/participants/consent_spec.rb

describe 'An eligible pt signs in and navigates to the consent form',
         type: :feature do
  context 'in English' do
    it 'consents to participate' do
      sign_in_pt_en(ENV['Pt_106_Email'], ENV['Pt_106_Password'])
      visit "#{ENV['Base_URL']}/#/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      # expect(page).to have_content ''
    end

    it 'does not consent to participate' do
      sign_in_pt_en(ENV['Pt_107_Email'], ENV['Pt_107_Password'])
      visit "#{ENV['Base_URL']}/#/consent"
      find('h2', text: 'PALO ALTO UNIVERSITY CONSENT')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      click_on 'Submit'
      # expect(page).to have_content ''
    end
  end

  context 'in Español' do
    it 'consents to participate' do
      sign_in_pt_en(ENV['Pt_206_Email'], ENV['Pt_206_Password'])
      visit "#{ENV['Base_URL']}/#/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      first('.ng-pristine.ng-untouched.ng-valid').click
      click_on 'Submit'
      # expect(page).to have_content ''
    end

    it 'does not consent to participate' do
      sign_in_pt_en(ENV['Pt_207_Email'], ENV['Pt_207_Password'])
      visit "#{ENV['Base_URL']}/#/consent"
      find('h2', text: 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      page.all('.ng-pristine.ng-untouched.ng-valid')[1].click
      click_on 'Submit'
      # expect(page).to have_content ''
    end
  end
end
