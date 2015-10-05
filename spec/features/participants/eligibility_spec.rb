# filename: spec/features/participants/eligibility_spec.rb

describe 'A registered user', type: :feature do
  context 'in English' do
    it 'completes eligibility survey and is eligible' do
      sign_in_pt_en(ENV['Pt_101_Email'], ENV['Pt_101_Password'])
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

    it 'completes eligibility survey and is ineligible due to age' do
      sign_in_pt_en(ENV['Pt_102_Email'], ENV['Pt_102_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
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
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      sign_in_pt_en(ENV['Pt_103_Email'], ENV['Pt_103_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?']
      ans = ['No', 'Yes', 'Yes']

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q3' do
      sign_in_pt_en(ENV['Pt_104_Email'], ENV['Pt_104_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?']
      ans = ['Yes', 'No', 'Yes']

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end
  end

  context 'in Español' do
    it 'completes eligibility survey and is eligible' do
      sign_in_pt_es(ENV['Pt_201_Email'], ENV['Pt_201_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?']
      qs.each do |text|
        within('.form-group', text: text) do
          choose 'Sí'
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      sign_in_pt_es(ENV['Pt_202_Email'], ENV['Pt_202_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?']
      qs.each do |text|
        within('.form-group', text: text) do
          choose 'Sí'
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      sign_in_pt_es(ENV['Pt_203_Email'], ENV['Pt_203_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?']
      ans = ['No', 'Sí', 'Sí']

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q3' do
      sign_in_pt_es(ENV['Pt_204_Email'], ENV['Pt_204_Password'])
      visit "#{ENV['Base_URL']}/#/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?']
      ans = ['Sí', 'No', 'Sí']

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end
  end
end
