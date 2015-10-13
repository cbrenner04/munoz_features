# filename: spec/features/participants/login_spec.rb

describe 'A visitor to the site', type: :feature, metadata: :participant do
  before do
    visit ENV['Base_URL']
  end

  context 'is English speaking' do
    it 'confirms email' do
      visit "#{ENV['Base_URL']}/en/participants/confirmation?" \
            "confirmation_token=#{ENV['Pt_3_Confirmation']}"
      expect(page)
        .to have_content 'Your email address has been successfully confirmed.'
      fill_in 'participant_email', with: ENV['Pt_3_Email']
      fill_in 'participant_password', with: ENV['Pt_3_Password']
      click_on 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'is a registered participant and signs in' do
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_112_Email']
      fill_in 'participant_password', with: ENV['Pt_112_Password']
      click_on 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'is not a registered participant, cannot sign in' do
      click_on 'Sign in'
      fill_in 'participant_email', with: 'fake@example.com'
      fill_in 'participant_password', with: 'fake password'
      click_on 'Sign in'
      expect(page).to have_content 'Invalid email or password'
    end

    it 'is a registered participant and resets their password' do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      click_on 'Forgot your password?'
      fill_in 'participant_email', with: ENV['Pt_110_Email']
      click_on 'Send me reset password instructions'
      expect(page).to have_content 'You will receive an email with ' \
                                   'instructions on how to reset your ' \
                                   'password in a few minutes.'
    end

    it "uses 'Didn't receive confirmation instructions?'" do
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

    it 'is a registered participant who locks their account' do
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

    it "uses 'Didn't receive unlock instructions?'" do
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

    it 'signs in, signs out' do
      sign_in_pt_en('111')
      find('.navbar-toggle').click
      click_on 'Sign out'
      expect(page).to have_css('a', text: 'Sign in')
    end
  end

  context 'is Spanish speaking' do
    it 'confirms email' do
      visit "#{ENV['Base_URL']}/es/participants/confirmation?" \
            "confirmation_token=#{ENV['Pt_4_Confirmation']}"
      expect(page)
        .to have_content 'Tu cuenta ha sido confirmada satisfactoriamente.'
      fill_in 'participant_email', with: ENV['Pt_4_Email']
      fill_in 'participant_password', with: ENV['Pt_4_Password']
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Sesión iniciada.'
    end

    it 'is a registered participant and signs in in Español' do
      click_on 'Iniciar sésion'
      fill_in 'participant_email', with: ENV['Pt_212_Email']
      fill_in 'participant_password', with: ENV['Pt_212_Password']
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Sesión iniciada.'
      expect(page).to have_css('a', text: 'Set Your Quit Date (ES)') # need to update with Spanish
    end

    it 'is not a registered participant, cannot sign in' do
      click_on 'Iniciar sésion'
      fill_in 'participant_email', with: 'fake@example.com'
      fill_in 'participant_password', with: 'fake password'
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Email o contraseña no válidos.'
    end

    it 'is a registered participant and resets their password' do
      click_on 'Iniciar sésion'
      find('h2', text: 'Iniciar sésion')
      click_on '¿Ha olvidado su contraseña?'
      fill_in 'participant_email', with: ENV['Pt_210_Email']
      click_on 'Envíeme las instrucciones para resetear mi contraseña'
      expect(page).to have_content 'Recibirás un correo con instrucciones ' \
                                   'sobre cómo resetear tu contraseña en ' \
                                   'unos pocos minutos.'
    end

    it "uses 'Didn't receive confirmation instructions?'" do
      click_on 'Iniciar sésion'
      find('h2', text: 'Iniciar sésion')
      click_on '¿No ha recibido las instrucciones de confirmación?'
      find('h2', text: 'Reenviar instrucciones de confirmación')
      fill_in 'participant_email', with: ENV['Pt_8_Email']
      click_on 'Reenviar instrucciones de confirmación'
      expect(page).to have_content 'Vas a recibir un correo con ' \
                                   'instrucciones sobre cómo confirmar tu ' \
                                   'cuenta en unos minutos.'
    end

    it 'is a registered participant who locks their account' do
      click_on 'Iniciar sésion'
      find('h2', text: 'Iniciar sésion')
      18.times do
        fill_in 'participant_email', with: ENV['Pt_205_Email']
        fill_in 'participant_password', with: 'whoops'
        click_on 'Iniciar sésion'
        expect(page).to have_content 'Email o contraseña no válidos.'
      end

      fill_in 'participant_email', with: ENV['Pt_205_Email']
      fill_in 'participant_password', with: 'whoops'
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Tienes un intento más antes de que tu ' \
                                   'cuenta sea bloqueada.'

      fill_in 'participant_email', with: ENV['Pt_205_Email']
      fill_in 'participant_password', with: 'whoops'
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Tu cuenta está bloqueada.'
    end

    it "uses 'Didn't receive unlock instructions?'" do
      click_on 'Iniciar sésion'
      find('h2', text: 'Iniciar sésion')
      click_on 'No ha recibido instrucciones para desbloquear?'
      find('h2', text: 'Reenviar instrucciones para desbloquear')
      fill_in 'participant_email', with: ENV['Pt_7_Email']
      click_on 'Reenviar instrucciones para desbloquear'
      expect(page).to have_content 'Vas a recibir instrucciones para ' \
                                   'desbloquear tu cuenta en unos pocos ' \
                                   'minutos.'
    end

    it 'signs in, signs out' do
      sign_in_pt_es('211')
      find('.navbar-toggle').click
      click_on 'Finalizar la sesión'
      expect(page).to have_css('a', text: 'Iniciar sésion')
    end

    it 'signs in, visits Google, returns to app, sees correct home page' do
      sign_in_pt_es('211')
      find('a', text: 'Set Your Quit Date (ES)')
      visit 'https://www.google.com'
      find('.content')
      visit ENV['Base_URL']
      expect(page).to have_content 'Set Your Quit Date (ES)' # need to update with Spanish
    end

    it 'signs in, navigates to another page, uses brand link, sees correct home' do
      sign_in_pt_es('211')
      click_on 'Stop Smoking Guide (ES)' # need to update with Spanish
      find('h2', text: 'Stop Smoking Guide')
      find('.navbar-brand').click
      expect(page).to have_content 'Set Your Quit Date (ES)'
    end
  end
end
