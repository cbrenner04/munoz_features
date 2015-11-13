# filename: spec/features/participants/eligibility_spec.rb

require_relative '../../../lib/zip_codes.rb'

describe 'A visitor to the site', type: :feature, metadata: :participant do
  context 'in English' do
    it 'navigates to the eligibility page' do
      visit "#{ENV['Base_URL']}"
      click_on 'English'
      expect(page).to have_content 'Please answer the following questions to'
      click_on 'Continue'
      expect(page).to have_content 'How old are you?'
    end

    it 'switches to Español when filling out eligibility' do
      visit "#{ENV['Base_URL']}"
      click_on 'English'
      click_on 'Continue'
      within('.form-group', text: 'Are you currently a smoker?') do
        choose 'Yes'
      end

      go_to('Español')
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[value = true]').should be_checked
    end

    it 'completes eligibility survey and is eligible' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_101_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_101_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_101_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'You are eligible to participate'
      expect(page).to have_content 'Thank you!  Please check your email to ' \
                                   'verify your account and continue.'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('17')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_102_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_102_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_102_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(No Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_103_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_103_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_103_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q3' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes No)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_104_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_104_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_104_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'You are not eligible to participate'
    end

    it 'does not fill in age, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_9_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_9_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_9_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'fills in an age below the lower bound, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('0')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_9_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_9_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_9_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'fills in an age above the upper bound, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('121')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_9_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_9_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_9_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in Q2, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      within('.form-group', text: 'Are you thinking of quitting') do
        choose 'Yes'
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_9_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_9_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_9_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in Q3, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      within('.form-group', text: 'Are you currently a smoker?') do
        choose 'Yes'
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_9_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_9_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_9_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill zip code, can submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      find('input[type = email]').set(ENV['Pt_31_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_31_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_31_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'You are eligible to participate'
    end

    it 'fills in a SF zip code, sees the drop down for selecting clinic' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      expect(page)
        .to_not have_content 'Where do you get most of your medical care?'
      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      expect(page)
        .to have_css('.form-group',
                     text: 'Where do you get most of your medical care?')
    end

    it 'fills in a zip other than SF, does not see the drop down for clinic' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      expect(page)
        .to_not have_content 'Where do you get most of your medical care?'
      page.all('input[type = tel]')[1].set(ZipCodes::CHI.sample)
      expect(page)
        .to_not have_content 'Where do you get most of your medical care?'
    end

    it 'does not fill in email, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      page.all('input[type = tel]')[2].set(ENV['Pt_25_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_25_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in phone number, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_9_Email'])
      find('input[type = password]').set(ENV['Pt_9_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in password, cannot submit form' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_25_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_25_Phone_Number'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'enters a duplicate email, sees error message' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_151_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_152_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_152_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Sorry, there was a problem. ' \
                                   'Please review your responses and try again.'
    end

    it 'enters a duplicate phone number, sees error message' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_152_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_151_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_152_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Sorry, there was a problem. ' \
                                   'Please review your responses and try again.'
    end

    it 'fills out eligibility, is eligible, consents, ' \
       'can still use app with unconfirmed email' do
      visit "#{ENV['Base_URL']}/en/pages/application#/en/eligibility"
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end

      find('input[type = email]').set(ENV['Pt_32_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_32_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_32_Password'])
      find('input[type = submit]').click
      click_on 'View the consent form'
      find('h3', text: 'PALO ALTO UNIVERSITY CONSENT')
      first('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required').click
      click_on 'Submit'
      expect(page).to have_css('iframe[class = ng-scope]')

      navigate_to('Cigarette Counter')
      expect(page).to have_content 'Yesterday'

      unless page.has_css?('.ng-binding', text: 'Stop Smoking Guide')
        find('.navbar-toggle').click
      end
      find('.ng-binding', text: 'Stop Smoking Guide').click
      expect(page).to have_css('a', text: 'Why Should I Quit?')

      sleep(2)
      go_to('Review Consent')
      expect(page).to have_content 'PALO ALTO UNIVERSITY CONSENT TO ' \
                                   'PARTICIPATE IN A RESEARCH STUDY'
    end
  end

  context 'in Español' do
    it 'navigates to the eligibilty page' do
      visit "#{ENV['Base_URL']}"
      click_on 'Español'
      expect(page)
        .to have_content 'Por favor responda las siguientes preguntas para ' \
                         'determinar si es elegible para participar.'
      click_on 'Continuar'
      expect(page).to have_content '¿Cuántos años tiene?'
    end

    it 'switches to English when filling out eligibility' do
      visit "#{ENV['Base_URL']}"
      click_on 'Español'
      click_on 'Continuar'
      within('.form-group', text: '¿Fuma usted actualmente?') do
        choose 'Sí'
      end

      go_to('English')
      find('.ng-binding', text: 'How old are you?')
      first('input[value = true]').should be_checked
    end

    it 'completes eligibility survey and is eligible' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
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
      expect(page).to have_content 'Usted es eligible para participar en ' \
                                   'nuestro estudio'
      expect(page).to have_content '¡Gracias! Por favor revise su correo ' \
                                   'electrónico para verificar su cuenta y ' \
                                   'continuar.'
    end

    it 'completes eligibility survey and is ineligible due to age' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('17')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_202_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_202_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_202_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Lo sentimos. Usted no es elegible para ' \
                                   'participar en nuestro estudio. Le ' \
                                   'recomendamos los siguientes 3 recursos ' \
                                   'para dejar de fumar: ' \
                                   'espanol.smokefree.gov, 1-800-NO-BUTTS ' \
                                   '(662-8887) o es.becomeanex.org. Gracias ' \
                                   'por contestar nuestras preguntas'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q2' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(No Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_203_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_203_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_203_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Lo sentimos. Usted no es elegible para ' \
                                   'participar en nuestro estudio. Le ' \
                                   'recomendamos los siguientes 3 recursos ' \
                                   'para dejar de fumar: ' \
                                   'espanol.smokefree.gov, 1-800-NO-BUTTS ' \
                                   '(662-8887) o es.becomeanex.org. Gracias ' \
                                   'por contestar nuestras preguntas'
    end

    it 'completes eligibility survey, is ineligible due to neg response Q3' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí No)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_204_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_204_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_204_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Lo sentimos. Usted no es elegible para ' \
                                   'participar en nuestro estudio. Le ' \
                                   'recomendamos los siguientes 3 recursos ' \
                                   'para dejar de fumar: ' \
                                   'espanol.smokefree.gov, 1-800-NO-BUTTS ' \
                                   '(662-8887) o es.becomeanex.org. Gracias ' \
                                   'por contestar nuestras preguntas'
    end

    it 'does not fill in age, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_10_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_10_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_10_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'fills in an age below the lower bound, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('0')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_10_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_10_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_10_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'fills in an age above the upper bound, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('121')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_10_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_10_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_10_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in Q2, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      within('.form-group', text: '¿Está pensando en dejar de fumar dentro') do
        choose 'Sí'
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_10_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_10_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_10_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in Q3, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      within('.form-group', text: '¿Fuma usted actualmente?') do
        choose 'Sí'
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_10_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_10_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_10_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in zip code, can submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      find('input[type = email]').set(ENV['Pt_33_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_33_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_33_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Usted es eligible para participar en ' \
                                   'nuestro estudio'
    end

    it 'fills in a SF zip code, sees the drop down for selecting a clinic' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      expect(page)
        .to_not have_content '¿Dónde recibe la mayor parte de su atención médic'
      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      expect(page)
        .to have_css('.form-group',
                     text: '¿Dónde recibe la mayor parte de su atención médica')
    end

    it 'fills in a zip code other than SF, does not see drop down for clinic' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      expect(page)
        .to_not have_content '¿Dónde recibe la mayor parte de su atención médic'
      page.all('input[type = tel]')[1].set(ZipCodes::CHI.sample)
      expect(page)
        .to_not have_content '¿Dónde recibe la mayor parte de su atención médic'
    end

    it 'does not fill in email, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      page.all('input[type = tel]')[2].set(ENV['Pt_26_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_26_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in phone number, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_26_Email'])
      find('input[type = password]').set(ENV['Pt_26_Password'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'does not fill in password, cannot submit form' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_26_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_26_Phone_Number'])
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    it 'enters duplicate email, sees error message' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_251_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_252_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_252_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Lo sentimos, hubo un problema. Por favor' \
                                   ' revise sus respuestas y vuelva a intentar.'
    end

    it 'enters duplicate phone number, sees error message' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_252_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_251_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_252_Password'])
      find('input[type = submit]').click
      expect(page).to have_content 'Lo sentimos, hubo un problema. Por favor' \
                                   ' revise sus respuestas y vuelva a intentar.'
    end

    it 'fills out eligibility, is eligible, consents,' \
       'is able to use the app with unconfirmed email' do
      visit "#{ENV['Base_URL']}/es/pages/application#/es/eligibility"
      find('.ng-binding', text: '¿Cuántos años tiene?')
      first('input[type = tel]').set('25')
      q = ['¿Fuma usted actualmente?',
           '¿Está pensando en dejar de fumar dentro de los próximos 30 días?']
      q.zip(%w(Sí Sí)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end

      page.all('input[type = tel]')[1].set(ZipCodes::SF.sample)
      within('.form-group',
             text: '¿Dónde recibe la mayor parte de su atención médica?') do
        select 'Centro de Salud Ocean Park'
      end

      find('input[type = email]').set(ENV['Pt_34_Email'])
      page.all('input[type = tel]')[2].set(ENV['Pt_34_Phone_Number'])
      find('input[type = password]').set(ENV['Pt_34_Password'])
      find('input[type = submit]').click
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
  end
end
