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
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_3_Email']
      fill_in 'participant_password', with: ENV['Pt_3_Password']
      click_on 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'is a registered participant and signs in' do
      click_on 'Sign in'
      fill_in 'participant_email', with: ENV['Pt_Email']
      fill_in 'participant_password', with: ENV['Pt_Password']
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
      fill_in 'participant_email', with: ENV['Pt_Email']
      click_on 'Send me reset password instructions'
      expect(page).to have_content 'You will receive an email with ' \
                                   'instructions on how to reset your ' \
                                   'password in a few minutes.'
    end


    it "selects 'Didn't receive confirmation instructions?' from sign in page"

    it "selects 'Didn't receive unlock instructions?' from sign in page"

    it "selects 'Sign in' from the sign up page"

    it "select 'Forgot your password?' from the sign up page"

    it "selects 'Didn't receive confirmation instructions?' from sign up page"

    it "selects 'Didn't receive unlock instructions?' from sign up page"

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
      visit "#{ENV['Base_URL']}/en/participants/confirmation?" \
            "confirmation_token=#{ENV['Pt_4_Confirmation']}"
      click_on 'Iniciar sésion'
      fill_in 'participant_email', with: ENV['Pt_4_Email']
      fill_in 'participant_password', with: ENV['Pt_4_Password']
      click_on 'Iniciar sésion'
      expect(page).to have_content 'Sesión iniciada.'
    end

    it 'is a registered participant and signs in in Español' do
      click_on 'Iniciar sésion'
      fill_in 'participant_email', with: ENV['Es_Pt_Email']
      fill_in 'participant_password', with: ENV['Es_Pt_Password']
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
      fill_in 'participant_email', with: ENV['Es_Pt_Email']
      click_on 'Envíeme las instrucciones para resetear mi contraseña'
      expect(page).to have_content 'Recibirás un correo con instrucciones ' \
                                   'sobre cómo resetear tu contraseña en ' \
                                   'unos pocos minutos.'
    end

    it "selects 'Didn't receive confirmation instructions?' from sign in page"

    it "selects 'Didn't receive unlock instructions?' from sign in page"

    it "selects 'Sign in' from the sign up page"

    it "select 'Forgot your password?' from the sign up page"

    it "selects 'Didn't receive confirmation instructions?' from sign up page"

    it "selects 'Didn't receive unlock instructions?' from sign up page"

    it 'is a registered participant, has selected Español previously, ' \
       'Español is set on subsequent logins'
  end
end
