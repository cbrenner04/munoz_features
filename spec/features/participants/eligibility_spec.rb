# filename: spec/features/participants/eligibility_spec.rb

describe 'A visitor to the site', type: :feature do
  context 'in English' do
    it 'navigates to the eligibilty page' do
      visit "#{ENV['Base_URL']}"
      click_on 'English'
      click_on 'Eligibility'
      expect(page.current_path).to eq '/en/pages/application#/en/eligibility'
    end

    it 'completes eligibility survey and is eligible' do
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

      r = [ENV['Pt_101_Email'], ENV['Pt_101_Phone_Number'],
           ENV['Pt_101_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
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

      r = [ENV['Pt_102_Email'], ENV['Pt_102_Phone_Number'],
           ENV['Pt_102_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?',
           'Do you currently live in California?']
      a = ['No', 'Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      r = [ENV['Pt_103_Email'], ENV['Pt_103_Phone_Number'],
           ENV['Pt_103_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q3' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?',
           'Do you currently live in California?']
      a = ['Yes', 'No', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      r = [ENV['Pt_104_Email'], ENV['Pt_104_Phone_Number'],
           ENV['Pt_104_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in age, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
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

      r = [ENV['Pt_9_Email'], ENV['Pt_9_Phone_Number'],
           ENV['Pt_9_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in Q2, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      q = ['Are you thinking of quitting smoking within the next 30 days?',
           'Do you currently live in California?']
      a = ['Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      r = [ENV['Pt_9_Email'], ENV['Pt_9_Phone_Number'],
           ENV['Pt_9_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in Q3, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      q = ['Are you currently a smoker?',
           'Do you currently live in California?']
      a = ['Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      r = [ENV['Pt_9_Email'], ENV['Pt_9_Phone_Number'],
           ENV['Pt_9_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in Q4, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      a = ['Yes', 'Yes']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      r = [ENV['Pt_9_Email'], ENV['Pt_9_Phone_Number'],
           ENV['Pt_9_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in email or phone number, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
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

      fill_in 'Q8', with: ENV['Pt_9_Password']
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in password, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
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

      fill_in 'Q6', with: ENV['Pt_9_Email']
      fill_in 'Q7', with: ENV['Pt_9_Phone_Number']
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey without giving email and is eligible' do
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

      fill_in 'Q7', with: ENV['Pt_11_Phone_Number']
      fill_in 'Q8', with: ENV['Pt_11_Password']

      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey without giving phone and is eligible' do
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

      fill_in 'Q6', with: ENV['Pt_12_Email']
      fill_in 'Q8', with: ENV['Pt_12_Password']

      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end
  end

  context 'in Español' do
    it 'navigates to the eligibilty page' do
      visit "#{ENV['Base_URL']}"
      click_on 'Español'
      click_on 'Eligibility'
      expect(page.current_path).to eq '/es/pages/application#/es/eligibility'
    end

    it 'completes eligibility survey and is eligible' do
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
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
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

      r = [ENV['Pt_202_Email'], ENV['Pt_202_Phone_Number'],
           ENV['Pt_202_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
           '¿Actualmente vive en California?']
      a = ['No', 'Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      r = [ENV['Pt_203_Email'], ENV['Pt_203_Phone_Number'],
           ENV['Pt_203_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q3' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
           '¿Actualmente vive en California?']
      a = ['Sí', 'No', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      r = [ENV['Pt_204_Email'], ENV['Pt_204_Phone_Number'],
           ENV['Pt_204_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in age, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
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

      r = [ENV['Pt_10_Email'], ENV['Pt_10_Phone_Number'],
           ENV['Pt_10_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in Q2, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      q = ['¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
           '¿Actualmente vive en California?']
      a = ['Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      r = [ENV['Pt_10_Email'], ENV['Pt_10_Phone_Number'],
           ENV['Pt_10_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in Q3, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      q = ['¿Fuma usted actualmente?',
           '¿Actualmente vive en California?']
      a = ['Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      r = [ENV['Pt_10_Email'], ENV['Pt_10_Phone_Number'],
           ENV['Pt_10_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in Q4, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      a = ['Sí', 'Sí']

      q.zip(a).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      r = [ENV['Pt_10_Email'], ENV['Pt_10_Phone_Number'],
           ENV['Pt_10_Password']]

      (6..8).zip(r).each do |i, response|
        fill_in "Q#{i}", with: response
      end

      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in email or phone number, sees proper error' do
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

      fill_in 'Q8', with: ENV['Pt_10_Password']
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in password, sees proper error' do
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

      fill_in 'Q6', with: ENV['Pt_10_Email']
      fill_in 'Q7', with: ENV['Pt_10_Phone_Number']
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility without giving phone number, is eligible' do
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

      fill_in 'Q6', with: ENV['Pt_13_Email']
      fill_in 'Q8', with: ENV['Pt_13_Password']
      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility without giving email, is eligible' do
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

      fill_in 'Q7', with: ENV['Pt_14_Phone_Number']
      fill_in 'Q8', with: ENV['Pt_14_Password']
      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end
  end
end
