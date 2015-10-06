# filename: spec/features/participants/eligibility_spec.rb

describe 'A visitor to the site', type: :feature do
  context 'in English' do
    it 'navigates to the eligibilty page' do
      visit "#{ENV['Base_URL']}"
      click_on 'English'
      click_on 'Eligibility'
      expect(page.current_path).to eq '/en/pages/application/#/en/eligibility'
    end

    it 'completes eligibility survey and is eligible' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '25'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['Yes', 'Yes', 'Yes', ENV['Pt_101_Email'],
             ENV['Pt_101_Phone_Number'], ENV['Pt_101_Password'],
             ENV['Pt_101_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['Yes', 'Yes', 'Yes', ENV['Pt_102_Email'],
             ENV['Pt_102_Phone_Number'], ENV['Pt_102_Password'],
             ENV['Pt_102_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['No', 'Yes', 'Yes', ENV['Pt_103_Email'],
             ENV['Pt_103_Phone_Number'], ENV['Pt_103_Password'],
             ENV['Pt_103_Password']]

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
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '17'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['Yes', 'No', 'Yes', ENV['Pt_104_Email'],
             ENV['Pt_104_Phone_Number'], ENV['Pt_104_Password'],
             ENV['Pt_104_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in age, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['Yes', 'Yes', 'Yes', ENV['Pt_113_Email'],
             ENV['Pt_113_Phone_Number'], ENV['Pt_113_Password'],
             ENV['Pt_113_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in Q2, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      qs = ['Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['Yes', 'Yes', ENV['Pt_113_Email'], ENV['Pt_113_Phone_Number'],
             ENV['Pt_113_Password'], ENV['Pt_113_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in Q3, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      qs = ['Are you currently a smoker?',
            'Do you currently live in California?', 'Email', 'Phone Number',
            'Password', 'Confirm Password']
      ans = ['Yes', 'Yes', ENV['Pt_113_Email'], ENV['Pt_113_Phone_Number'],
             ENV['Pt_113_Password'], ENV['Pt_113_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in Q4, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Email', 'Phone Number', 'Password', 'Confirm Password']
      ans = ['Yes', 'Yes', ENV['Pt_113_Email'], ENV['Pt_113_Phone_Number'],
             ENV['Pt_113_Password'], ENV['Pt_113_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in email or phone number, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Password',
            'Confirm Password']
      ans = ['Yes', 'Yes', 'Yes', ENV['Pt_113_Password'],
             ENV['Pt_113_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in password, sees proper error' do
      visit "#{ENV['Base_URL']}/en/pages/application/#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      fill_in 'Q1', with: '28'
      qs = ['Are you currently a smoker?',
            'Are you thinking of quitting smoking within the next 30 days?',
            'Do you currently live in California?', 'Email', 'Phone Number']
      ans = ['Yes', 'Yes', 'Yes', ENV['Pt_113_Email'],
             ENV['Pt_113_Phone_Number']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Ocean Park Health Center'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end
  end

  context 'in Español' do
    it 'navigates to the eligibilty page' do
      visit "#{ENV['Base_URL']}"
      click_on 'Español'
      click_on 'Eligibility'
      expect(page.current_path).to eq '/es/pages/application/#/es/eligibility'
    end

    it 'completes eligibility survey and is eligible' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['Sí', 'Sí', 'Sí', ENV['Pt_201_Email'],
             ENV['Pt_201_Phone_Number'], ENV['Pt_201_Password'],
             ENV['Pt_201_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['Sí', 'Sí', 'Sí', ENV['Pt_202_Email'],
             ENV['Pt_202_Phone_Number'], ENV['Pt_202_Password'],
             ENV['Pt_202_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['No', 'Sí', 'Sí', ENV['Pt_203_Email'],
             ENV['Pt_203_Phone_Number'], ENV['Pt_203_Password'],
             ENV['Pt_203_Password']]

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
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '17'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['Sí', 'No', 'Sí', ENV['Pt_204_Email'],
             ENV['Pt_204_Phone_Number'], ENV['Pt_204_Password'],
             ENV['Pt_204_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in age, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['Sí', 'Sí', 'Sí', ENV['Pt_201_Email'],
             ENV['Pt_201_Phone_Number'], ENV['Pt_201_Password'],
             ENV['Pt_201_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in Q2, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['Sí', 'Sí', ENV['Pt_201_Email'], ENV['Pt_201_Phone_Number'],
             ENV['Pt_201_Password'], ENV['Pt_201_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in Q3, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Fuma usted actualmente?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono',
            'Contraseña', 'Confirmación de contraseña']
      ans = ['Sí', 'Sí', ENV['Pt_201_Email'], ENV['Pt_201_Phone_Number'],
             ENV['Pt_201_Password'], ENV['Pt_201_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in Q4, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            'Email', 'Número de teléfono', 'Contraseña',
            'Confirmación de contraseña']
      ans = ['Sí', 'Sí', ENV['Pt_201_Email'], ENV['Pt_201_Phone_Number'],
             ENV['Pt_201_Password'], ENV['Pt_201_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in email or phone number, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Contraseña',
            'Confirmación de contraseña']
      ans = ['Sí', 'Sí', 'Sí', ENV['Pt_201_Password'], ENV['Pt_201_Password']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    it 'does not fill in password, sees proper error' do
      visit "#{ENV['Base_URL']}/es/pages/application/#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      fill_in 'Q1', with: '25'
      qs = ['¿Fuma usted actualmente?',
            '¿Está pensando en dejar de fumar dentro de los próximos 30 días?',
            '¿Actualmente vive en California?', 'Email', 'Número de teléfono']
      ans = ['Sí', 'Sí', 'Sí', ENV['Pt_201_Email'],
             ENV['Pt_201_Phone_Number']]

      qs.zip(ans).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      check 'Centro de Salud Ocean Park'
      click_on 'Submit'
      expect(page).to have_content 'error'
    end
  end
end
