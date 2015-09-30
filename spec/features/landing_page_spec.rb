# filename: spec/features/landing_page_spec.rb

describe 'A visitor to the site', type: :feature do
  before do
    visit ENV['Base_URL']
  end

  context 'is English speaking' do
    it 'selects English' do
      click_on 'English'
      expect(page).to have_content 'Sign up'
    end

    it 'registers' do
      click_on 'English'
      find('a', text: 'Sign up').click
      fill_in 'participant_email', with: 'fake@example.com'
      fill_in 'participant_password', with: 'fakePassword'
      fill_in 'participant_password_confirmation', with: 'fakePassword'
      click_on 'Sign up'
      expect(page).to have_content 'A message with a confirmation link has ' \
                                   'been sent to your email address. Please ' \
                                   'follow the link to activate your account.'
    end

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
      fill_in 'participant_email', with: ENV['Pt_101_Email']
      fill_in 'participant_password', with: ENV['Pt_101_Password']
      click_on 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it "selects 'Sign up' from the sign in page" do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      click_on 'Sign up'
      expect(page).to have_css('h2', text: 'Sign up')
    end

    it 'is a registered participant and resets their password' do
      click_on 'Sign in'
      find('h2', text: 'Sign in')
      click_on 'Forgot your password?'
      fill_in 'participant_email', with: ENV['Pt_101_Email']
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

    it "selects 'Sign in' from the sign up page" do
      click_on 'English'
      click_on 'Sign up'
      find('h2', text: 'Sign up')
      click_on 'Sign in'
      expect(page).to have_css('h2', text: 'Sign in')
    end

    it "selects 'Forgot your password?' from the sign up page" do
      click_on 'English'
      click_on 'Sign up'
      find('h2', text: 'Sign up')
      click_on 'Forgot your password?'
      expect(page).to have_css('h2', text: 'Forgot your password?')
    end

    it "selects 'Didn't receive confirmation instructions?' on sign up page" do
      click_on 'English'
      click_on 'Sign up'
      find('h2', text: 'Sign up')
      click_on "Didn't receive confirmation instructions?"
      expect(page).to have_css('h2', text: 'Resend confirmation instructions')
    end

    it "selects 'Didn't receive unlock instructions?' from sign up page" do
      click_on 'English'
      click_on 'Sign up'
      find('h2', text: 'Sign up')
      click_on "Didn't receive unlock instructions?"
      expect(page).to have_css('h2', text: 'Resend unlock instructions')
    end

    it 'is a registered participant, has selected English previously, ' \
       ' English is set in subsequent logins'
  end

  context 'is Spanish speaking' do
    it 'selects Español' do
      click_on 'Español'
      expect(page).to have_content 'Registrarse'
    end

    it 'registers ' do
      click_on 'Español'
      find('a', text: 'Registrarse').click
      fill_in 'participant_email', with: 'fake_alt@example.com'
      fill_in 'participant_password', with: 'fakePassword'
      fill_in 'participant_password_confirmation', with: 'fakePassword'
      click_on 'Registrarse'
      expect(page).to have_content 'Se ha enviado un mensaje con un enlace ' \
                                   'de confirmación a tu correo electrónico. ' \
                                   'Abre el enlace para activar tu cuenta.'
    end

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
      fill_in 'participant_email', with: ENV['Pt_201_Email']
      fill_in 'participant_password', with: ENV['Pt_201_Password']
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Sesión iniciada.'
    end

    it "selects 'Sign up' from the sign in page" do
      click_on 'Iniciar sésion'
      find('h2', text: 'Iniciar sésion')
      click_on 'Registrarse'
      expect(page).to have_css('h2', text: 'Registrarse')
    end

    it 'is a registered participant and resets their password' do
      click_on 'Iniciar sésion'
      find('h2', text: 'Iniciar sésion')
      click_on '¿Ha olvidado su contraseña?'
      fill_in 'participant_email', with: ENV['Pt_201_Email']
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

    it "selects 'Iniciar sésion' from the sign up page" do
      click_on 'Español'
      find('a', text: 'Registrarse').click
      find('h2', text: 'Registrarse')
      click_on 'Iniciar sésion'
      expect(page).to have_css('h2', text: 'Iniciar sésion')
    end

    it "selects '¿Ha olvidado su contraseña?' from the sign up page" do
      click_on 'Español'
      find('a', text: 'Registrarse').click
      find('h2', text: 'Registrarse')
      click_on '¿Ha olvidado su contraseña?'
      expect(page).to have_css('h2', text: '¿Ha olvidado su contraseña?')
    end

    it "selects '¿No ha recibido las instrucciones de confirmación?' on sign " \
       'up page' do
      click_on 'Español'
      find('a', text: 'Registrarse').click
      find('h2', text: 'Registrarse')
      click_on '¿No ha recibido las instrucciones de confirmación?'
      expect(page)
        .to have_css('h2', text: 'Reenviar instrucciones de confirmación')
    end

    it "selects 'No ha recibido instrucciones para desbloquear?' from sign " \
       'up page' do
      click_on 'Español'
      find('a', text: 'Registrarse').click
      find('h2', text: 'Registrarse')
      click_on 'No ha recibido instrucciones para desbloquear?'
      expect(page)
        .to have_css('h2', text: 'Reenviar instrucciones para desbloquear')
    end

    it 'is a registered participant, has selected Español previously, ' \
       'Español is set on subsequent logins'
  end
end
