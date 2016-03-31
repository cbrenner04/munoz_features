require './lib/pages/participants'

class Participants
  # page object for Consent
  class Consent
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(consent)
      @locale ||= consent[:locale]
    end

    def ineligible_page
      var = participants.locale('en', 'es')
      @ineligible_page ||= 
        "#{ENV['Base_URL']}" \
        "/#{var}/pages/application#/#{var}/eligibility-result?isEligible=false"
    end

    def visible?
      var = participants.locale('PALO ALTO UNIVERSITY CONSENT',
                                'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      has_text? var
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
      var = participants.locale('Submit', 'Enviar')
      click_on var
    end

    def submitted?
      has_css? 'iframe[class = ng-scope]'
    end

    # For those who did not consent

    def click_set_quit_date
      var = participants.locale('Set Your Quit Date',
                                'Elija la fecha en que dejará de fumar')
      click_on var
    end

    def has_quit_date_visible?
      var = participants.locale('We', 'Mi')
      has_css?('a', text: var)
    end

    def click_stop_smoke_guide
      var = participants.locale('Stop Smoking Guide',
                                'Guía Para Dejar de Fumar')
      click_on var
    end

    def has_smoke_guide_visible?
      var = participants.locale('Why Should I Quit?',
                                '¿Por qué debo dejar de fumar?')
      has_css?('a', text: var)
    end

    def click_cig_counter
      var = participants.locale('Cigarette Counter',
                                'Contador de Cigarrillos')
      click_on var
    end

    def has_cig_counter_visible?
      var = participants.locale('Yesterday', 'Ayer')
      has_text? var
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
