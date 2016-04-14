# filename: spec/features/participants/login_spec.rb

feature 'A visitor to the site', metadata: :participant do
  before do
    visit ENV['Base_URL']
  end

  context 'is English speaking' do
    scenario 'is a registered participant and signs in' do
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_112_Email']
      fill_in 'participant_password', with: ENV['Pt_112_Password']
      click_on 'Sign in'
      expect(page).to have_css('a', text: 'Stop Smoking Guide')
    end

    scenario 'is not a registered participant, cannot sign in' do
      click_on 'Sign in'
      fill_in 'participant_email', with: 'fake@example.com'
      fill_in 'participant_password', with: 'fake password'
      click_on 'Sign in'
      expect(page).to have_content 'Invalid email or password'
    end

    scenario 'is a registered participant and request password reset' do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      click_on 'Forgot your password?'
      fill_in 'participant_email', with: ENV['Pt_110_Email']
      click_on 'Send me reset password instructions'
      expect(page).to have_content 'You will receive an email with ' \
                                   'instructions on how to reset your ' \
                                   'password in a few minutes.'
    end

    scenario "uses 'Didn't receive confirmation instructions?'" do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      click_on "Didn't receive confirmation instructions?"
      find('h2', text: 'Resend confirmation instructions')
      fill_in 'participant_email', with: ENV['Pt_5_Email']
      click_on 'Resend confirmation instructions'
      expect(page).to have_content 'You will receive an email with ' \
                                   'instructions for how to confirm your ' \
                                   'email address in a few minutes.'
    end

    scenario 'is a registered participant who locks their account' do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      18.times do
        fill_in 'participant_email', with: ENV['Pt_105_Email']
        fill_in 'participant_password', with: 'whoops'
        click_on 'Sign in'
        expect(page).to have_content 'Invalid email or password.'
      end

      fill_in 'participant_email', with: ENV['Pt_105_Email']
      fill_in 'participant_password', with: 'whoops'
      click_on 'Sign in'
      expect(page).to have_content 'You have one more attempt before your ' \
                                   'account is locked.'

      fill_in 'participant_email', with: ENV['Pt_105_Email']
      fill_in 'participant_password', with: 'whoops'
      click_on 'Sign in'
      expect(page).to have_content 'Your account is locked.'
    end

    scenario "uses 'Didn't receive unlock instructions?'" do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      click_on "Didn't receive unlock instructions?"
      find('h2', text: 'Resend unlock instructions')
      fill_in 'participant_email', with: ENV['Pt_6_Email']
      click_on 'Resend unlock instructions'
      expect(page).to have_content 'You will receive an email with ' \
                                   'instructions for how to unlock your ' \
                                   'account in a few minutes.'
    end

    scenario 'signs in, signs out' do
      sign_in_pt_en('111')
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      click_on 'Sign out'
      expect(page).to have_css('a', text: 'Sign in')
    end

    scenario 'signs in, goes to a tool, navigates home using brand link' do
      sign_in_pt_en('111')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.navbar-brand.ng-binding').click
      expect(page).to have_content 'Stop Smoking Guide'
    end

    scenario 'signs in, goes to a tool, navigates home using Home link' do
      sign_in_pt_en('111')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.navbar-toggle').click
      click_on 'Home'
      expect(page).to have_content 'Stop Smoking Guide'
      go_to('Sign out')
    end
  end

  context 'is Spanish speaking' do
    scenario 'is a registered participant and signs in in Español' do
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: ENV['Pt_212_Email']
      fill_in 'participant_password', with: ENV['Pt_212_Password']
      click_on 'Iniciar sesión'
      find('a', text: 'Guía Para Dejar de Fumar')
    end

    scenario 'is not a registered participant, cannot sign in' do
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: 'fake@example.com'
      fill_in 'participant_password', with: 'fake password'
      click_on 'Iniciar sesión'
      expect(page).to have_content 'Email o contraseña no válidos.'
    end

    scenario 'is a registered participant and requests password reset' do
      click_on 'Iniciar sesión'
      find('h2', text: 'Iniciar sesión')
      click_on '¿Ha olvidado su contraseña?'
      fill_in 'participant_email', with: ENV['Pt_210_Email']
      click_on 'Envíeme las instrucciones para cambiar mi contraseña'
      expect(page).to have_content 'Recibirá un correo con instrucciones ' \
                                   'sobre cómo cambiar su contraseña en ' \
                                   'unos pocos minutos.'
    end

    scenario "uses 'Didn't receive confirmation instructions?'" do
      click_on 'Iniciar sesión'
      find('h2', text: 'Iniciar sesión')
      click_on '¿No ha recibido las instrucciones de confirmación?'
      find('h2', text: 'Reenviar instrucciones de confirmación')
      fill_in 'participant_email', with: ENV['Pt_8_Email']
      click_on 'Reenviar instrucciones de confirmación'
      expect(page).to have_content 'Va a recibir un email con ' \
                                   'instrucciones sobre cómo confirmar su ' \
                                   'cuenta en unos minutos.'
    end

    scenario 'is a registered participant who locks their account' do
      click_on 'Iniciar sesión'
      find('h2', text: 'Iniciar sesión')
      18.times do
        fill_in 'participant_email', with: ENV['Pt_205_Email']
        fill_in 'participant_password', with: 'whoops'
        click_on 'Iniciar sesión'
        expect(page).to have_content 'Email o contraseña no válidos.'
      end

      fill_in 'participant_email', with: ENV['Pt_205_Email']
      fill_in 'participant_password', with: 'whoops'
      click_on 'Iniciar sesión'
      expect(page).to have_content 'Tiene un intento más antes de que su ' \
                                   'cuenta sea bloqueada.'

      fill_in 'participant_email', with: ENV['Pt_205_Email']
      fill_in 'participant_password', with: 'whoops'
      click_on 'Iniciar sesión'
      expect(page).to have_content 'Su cuenta está bloqueada.'
    end

    scenario "uses 'Didn't receive unlock instructions?'" do
      click_on 'Iniciar sesión'
      find('h2', text: 'Iniciar sesión')
      click_on 'No ha recibido instrucciones para desbloquear?'
      find('h2', text: 'Reenviar instrucciones para desbloquear')
      fill_in 'participant_email', with: ENV['Pt_7_Email']
      click_on 'Reenviar instrucciones para desbloquear'
      expect(page).to have_content 'Vas a recibir instrucciones para ' \
                                   'desbloquear tu cuenta en unos pocos ' \
                                   'minutos.'
    end

    scenario 'signs in, signs out' do
      sign_in_pt_es('211')
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      click_on 'Finalizar la sesión'
      expect(page).to have_css('a', text: 'Iniciar sesión')
    end

    scenario 'signs in, visits Google, returns to app, sees correct home page' do
      sign_in_pt_es('211')
      find('a', text: 'Guía Para Dejar de Fumar')
      visit 'https://www.google.com'
      find('.content')
      visit ENV['Base_URL']
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end

    scenario 'signs in, navigates to another page, uses brand link, ' \
       'sees correct home' do
      sign_in_pt_es('211')
      click_on 'Guía Para Dejar de Fumar'
      find('h3', text: 'Guía Para Dejar de Fumar')
      find('.navbar-brand').click
      expect(page).to have_content 'Contador de Cigarrillos'
    end

    scenario 'signs in, goes to a tool, navigates home using brand link' do
      sign_in_pt_en('211')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.navbar-brand.ng-binding').click
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end

    scenario 'signs in, goes to a tool, navigates home using Home link' do
      sign_in_pt_en('211')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.navbar-toggle').click
      click_on 'Inicio'
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end
  end
end

feature 'A visitor to the site', metadata: :participant do
  before do
    visit ENV['Base_URL']
  end

  after do
    page.driver.browser.manage.window.resize_to(360, 591)
  end

  context 'in English' do
    scenario 'confirms phone' do
      visit "#{ENV['Base_URL']}/confirm_phone?locale=en&" \
            "token=#{ENV['Pt_29_Confirmation']}"
      sleep(2)
      expect(page).to have_content 'Thank you for confirming your phone number.'
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_29_Email']
      fill_in 'participant_password', with: ENV['Pt_29_Password']
      click_on 'Sign in'
      find('a', text: 'Stop Smoking Guide')
      go_to('Sign out')

      sign_in_user
      within('.nav.nav-pills.nav-stacked') do
        click_on 'Participant phones'
      end

      within('.participant_phone_row', text: '3128404100') do
        time = Time.now - 2 * 60 * 60
        expect(page).to have_content "#{time.strftime('%B %d, %Y %H')}"
      end
    end
  end

  context 'in Español' do
    scenario 'confirms phone' do
      visit "#{ENV['Base_URL']}/confirm_phone?locale=es&" \
            "token=#{ENV['Pt_30_Confirmation']}"
      sleep(2)
      expect(page)
        .to have_content 'Gracias por confirmar su número de teléfono.'
      click_on 'Iniciar sesión'
      fill_in 'participant_email', with: ENV['Pt_30_Email']
      fill_in 'participant_password', with: ENV['Pt_30_Password']
      click_on 'Iniciar sesión'
      find('a', text: 'Guía Para Dejar de Fumar')
      go_to('Finalizar la sesión')

      sign_in_user
      within('.nav.nav-pills.nav-stacked') do
        click_on 'Participant phones'
      end

      within('.participant_phone_row', text: '3128404101') do
        time = Time.now - 2 * 60 * 60
        expect(page).to have_content "#{time.strftime('%B %d, %Y %H')}"
      end
    end
  end
end

feature 'A visitor to the site', metadata: :participant do
  context 'is English speaking' do
    scenario 'confirms email' do
      visit "#{ENV['Base_URL']}/en/participants/confirmation?" \
            "confirmation_token=#{ENV['Pt_3_Confirmation']}"
      expect(page)
        .to have_content 'Your email address has been successfully confirmed.'
      fill_in 'participant_email', with: ENV['Pt_3_Email']
      fill_in 'participant_password', with: ENV['Pt_3_Password']
      click_on 'Sign in'
      expect(page).to have_css('a', text: 'Stop Smoking Guide')
    end
  end

  context 'is Spanish speaking' do
    scenario 'confirms email' do
      visit "#{ENV['Base_URL']}/es/participants/confirmation?" \
            "confirmation_token=#{ENV['Pt_4_Confirmation']}"
      expect(page)
        .to have_content 'Tu cuenta ha sido confirmada satisfactoriamente.'
      fill_in 'participant_email', with: ENV['Pt_4_Email']
      fill_in 'participant_password', with: ENV['Pt_4_Password']
      click_on 'Iniciar sesión'
      find('a', text: 'Guía Para Dejar de Fumar')
    end
  end
end

feature 'A visitor to the site', metadata: :participant do
  after do
    page.driver.browser.manage.window.resize_to(360, 591)
  end

  context 'is English speaking' do
    scenario 'gets notifications scheduled' do
      sign_in_pt_en('156')
      find('a', text: 'Stop Smoking Guide')
      go_to('Sign out')

      sign_in_user
      visit "#{ENV['Base_URL']}/admin/notification_schedule"
      within first('.notification_schedule_row') do
        three = Date.today + 90
        expect(page).to have_content "#{three.strftime('%B %d, %Y')}"
      end

      row = all('.notification_schedule_row')
      within row[1] do
        two = Date.today + 60
        expect(page).to have_content "#{two.strftime('%B %d, %Y')}"
      end

      within row[2] do
        one = Date.today + 30
        expect(page).to have_content "#{one.strftime('%B %d, %Y')}"
      end
    end
  end

  context 'is Spanish speaking' do
    scenario 'gets notifications scheduled' do
      sign_in_pt_es('256')
      find('a', text: 'Guía Para Dejar de Fumar')
      go_to('Finalizar la sesión')

      sign_in_user
      visit "#{ENV['Base_URL']}/admin/notification_schedule"
      within first('.notification_schedule_row') do
        three = Date.today + 90
        expect(page).to have_content "#{three.strftime('%B %d, %Y')}"
      end

      row = all('.notification_schedule_row')
      within row[1] do
        two = Date.today + 60
        expect(page).to have_content "#{two.strftime('%B %d, %Y')}"
      end

      within row[2] do
        one = Date.today + 30
        expect(page).to have_content "#{one.strftime('%B %d, %Y')}"
      end
    end
  end
end


# Use resize where 'sign in user' is above instead of this method.
def sign_in_user
  page.driver.browser.manage.window.resize_to(1280, 743)
  visit "#{ENV['Base_URL']}/admin"
  fill_in 'user_email', with: ENV['User_1_Email']
  fill_in 'user_password', with: ENV['User_1_Password']
  click_on 'Sign in'
  find('h1', text: 'Site Administration')
end
