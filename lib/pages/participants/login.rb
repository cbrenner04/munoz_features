require './lib/pages/participants'
require './lib/pages/users'

class Participants
  # page object for Consent
  class Login
    include Capybara::DSL

    def initialize(login)
      @locale ||= login[:locale]
    end

    def has_home_visible?
      has_css?('a',
        text: participants.locale('Stop Smoking Guide',
                                       'Guía Para Dejar de Fumar'))
    end

    def sign_in_unsuccessful?
      has_content?('a',
        text: participants.locale('Invalid email or password',
                                  'Email o contraseña no válidos.'))
    end

    def click_sign_in
      click_on participants.locale('Sign in', 'Iniciar sesión')
    end

    def find_sign_in
      find('h2', text: participants.locale('Sign in', 'Iniciar sesión'))
    end

    def click_navbar
      find('.navbar-toggle').click
    end

    def click_dropdown
      find('.dropdown-toggle').click
    end

    def click_home_icon
      find('.navbar-brand.ng-binding').click
    end

    def click_forgot_pw
      click_on participants.locale('Forgot your password?',
                                  '¿Ha olvidado su contraseña?')
    end

    def click_send_pw_instructions
      click_on participants.locale('Send me reset password instructions',
                                   'Envíeme las instrucciones para' \
                                      'cambiar mi contraseña')
    end

    def has_pw_reset_confirm_message?
      has_content? participants.locale('You will receive an email with ' \
                                         'instructions on how to reset your ' \
                                         'password in a few minutes.',
                                       'Recibirá un correo con instrucciones ' \
                                         'sobre cómo cambiar su contraseña ' \
                                         'en unos pocos minutos.')
    end

    def click_did_not_receive_confirm_instructions
      click_on participants.locale("Didn't receive confirmation instructions?",
                                   '¿No ha recibido las instrucciones ' \
                                     'de confirmación?')
    end

    def find_resend_confirm_instructions
      find('h2', text: participants.locale('Resend confirmation instructions',
                                           'Reenviar instrucciones ' \
                                             'de confirmación'))
    end

    def click_resend_confirm_instructions
      click_on participants.locale('Resend confirmation instructions',
                                   'Reenviar instrucciones de confirmación')
    end

    def has_email_confirm_message?
      has_content? participants.locale('You will receive an email with ' \
                                         'instructions for how to confirm ' \
                                         'your email address in ' \
                                         'a few minutes.',
                                       'Va a recibir un email con ' \
                                         'instrucciones sobre cómo ' \
                                         'confirmar su cuenta ' \
                                         'en unos minutos.')
    end

    def has_invalid_email_pw?
      has_content? participants.locale('Invalid email or password.',
                                       'Email o contraseña no válidos.')
    end

    def has_lock_warning?
      has_content? participants.locale('You have one more attempt before ' \
                                         'your account is locked.',
                                       'Tiene un intento más antes de que ' \
                                         'su cuenta sea bloqueada.')
    end

    def has_account_locked?
      has_content? participants.locale('Your account is locked.',
                                       'Su cuenta está bloqueada.')
    end

    def click_did_not_receive_unlock_instructions
      click_on participants.locale("Didn't receive unlock instructions?",
                                   'No ha recibido instrucciones ' \
                                     'para desbloquear?')
    end

    def find_resend_unlock_instructions
      find('h2', text:
        participants.locale('Resend unlock instructions',
                            'Reenviar instrucciones para desbloquear'))
    end

    def click_resend_unlock_instructions
      click_on participants.locale('Resend unlock instructions',
                                   'Reenviar instrucciones para desbloquear')
    end

    def has_resend_unlock_message?
      has_content? participants.locale('You will receive an email with ' \
                                         'instructions for how to unlock ' \
                                         'your account in a few minutes.',
                                       'Vas a recibir instrucciones para ' \
                                         'desbloquear tu cuenta en unos ' \
                                         'pocos minutos.')
    end

    def click_sign_out
      click_on participants.locale('Sign out', 'Finalizar la sesión')
    end

    def has_login_page_visible?
      has_css?('a', text: participants.locale('Sign in', 'Iniciar sesión'))
    end

    def click_home_btn
      click_on participants.locale('Home', 'Inicio')
    end

    def has_confirmation
      has_content? participants.locale(
        'Your email address has been successfully confirmed.',
        'Tu cuenta ha sido confirmada satisfactoriamente.')
    end

    def has_confirm_message?
      has_content? participants.locale(
        'Thank you for confirming your phone number.',
        'Gracias por confirmar su número de teléfono.')
    end

    def find_stop_smoking_guide
      find('a', text: participants.locale('Stop Smoking Guide',
                                          'Guía Para Dejar de Fumar'))
    end

    def click_stop_smoking_guide
      click_on participants.locale('Stop Smoking Guide',
                                   'Guía Para Dejar de Fumar')
    end

    # User related methods

    def phone_confirm_time
      within('.participant_phone_row', text: phone_num) do
        time = Time.now - 2 * 60 * 60

        expect(page).to have_content "#{time.strftime('%B %d, %Y %H')}"
      end
    end

    def reminder_90_days
      within first('.notification_schedule_row') do
        three = Date.today + 90

        expect(page).to have_content "#{three.strftime('%B %d, %Y')}"
      end
    end

    def reminder_60_days
      row = all('.notification_schedule_row')
      within row[1] do
        two = Date.today + 60

        expect(page).to have_content "#{two.strftime('%B %d, %Y')}"
      end
    end

    def reminder_30_days
      row = all('.notification_schedule_row')
      within row[2] do
        one = Date.today + 30

        expect(page).to have_content "#{one.strftime('%B %d, %Y')}"
      end
    end


    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end

    def users
      @users ||= Users.new
    end

    def phone_num
      @phone_num ||= users.locale('3128404100', '3128404101')
    end
  end
end
