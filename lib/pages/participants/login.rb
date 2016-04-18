require './lib/pages/participants'

class Participants
  # page object for Consent
  class Login
    include Capybara::DSL

    def initialize(login)
      @locale ||= login[:locale]
    end

    def sign_in_successful?
      has_content?('a', text: participants.locale('Stop Smoking Guide',
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

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
