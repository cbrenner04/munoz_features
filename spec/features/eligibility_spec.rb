# filename: spec/features/eligibility_spec.rb

describe 'A registered user', type: :feature do
  context 'in English' do
    it 'completes eligibility survey and is eligible' do
      sign_in_pt_en(ENV['Pt_Email'], ENV['Pt_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '25'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?']
      qs.each do |text|
        within('.form-group', text: text) do
          choose 'Yes'
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey and is ineligible'
  end

  context 'in Español' do
    it 'completes eligibility survey and is eligible'

    it 'completes eligibility survey and is ineligible'
  end
end
