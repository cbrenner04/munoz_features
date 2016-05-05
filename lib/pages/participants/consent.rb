require './lib/pages/participants'

class Participants
  # page object for Consent
  class Consent
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(consent)
      @locale ||= consent[:locale]
    end

    def visible?
      has_text? participants.locale('PALO ALTO UNIVERSITY CONSENT',
                                    'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
    end

    def give_consent
      find('#consent-yes').click
    end

    def decline_consent
      find('#consent-no').click
    end

    def has_consent_response?
      find('input[value = true]').should be_checked
    end

    def has_no_consent_link?
      var = participants.locale('View the consent form',
                                'Ver el formulario de consentimiento')
      expect { click_on var }
        .to raise_error(Capybara::ElementNotFound)
    end

    def click_submit
      click_on participants.locale('Submit', 'Enviar')
    end

    def submitted?
      has_css? 'iframe[class = ng-scope]'
    end

    # For those who did not consent

    def click_set_quit_date
      click_on participants.locale('Set Your Quit Date',
                                   'Elija la fecha en que dejará de fumar')
    end

    def click_stop_smoke_guide
      click_on participants.locale('Stop Smoking Guide',
                                   'Guía Para Dejar de Fumar')
    end

    def click_cig_counter
      click_on participants.locale('Cigarette Counter',
                                   'Contador de Cigarrillos')
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
