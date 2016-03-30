require './lib/pages/participants'

class Participants
  # page object for Consent
  class Consent
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(consent)
      @locale ||= consent[:locale]
      @email ||= consent[:email]
      @phone ||= consent[:phone]
      @password ||= consent[:password]
    end

    def eligibility_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#{var}/pages/application#/#{var}/eligibility"
    end

    def visible?
      var = participants.locale('PALO ALTO UNIVERSITY CONSENT',
                                'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      has_text? var
    end

    def find_age
      var = participants.locale('How old are you?', '¿Cuántos años tiene?')
      find('.ng-binding', text: var)
    end

    def set_age
      first('input[type = tel]').set('25')
    end

    def answer_smoker
      ques = participants.locale(english_smoking_questions,
                                 spanish_smoking_questions)
      answ = participants.locale(%w(Yes Yes), %w(Sí Sí))
      ques.zip(answ) { |q, a| within('.form-group', text: q) { choose a } }
    end

    def enter_sf_zip
      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
    end

    def answer_medical_care
      x = participants.locale(
        'Where do you get most of your medical care?',
        '¿Dónde recibe la mayor parte de su atención médica?'
      )
      y = participants.locale('Ocean Park Health Center',
                              'Centro de Salud Ocean Park')
      within('.form-group', text: x) { select y }
    end

    def enter_email
      find('input[type = email]').set(@email)
    end

    def enter_phone_num
      all('input[type = tel]')[2].set(@phone)
    end

    def enter_password
      find('input[type = password]').set(@password)
    end

    def give_consent
      find('#consent-yes').click
    end

    def decline_consent
      find('#consent-no').click
    end

    def click_eligibility_submit
      find('input[type = submit]').click
    end

    def click_view_consent
      var = participants.locale('View the consent form',
                                'Ver el formulario de consentimiento')
      click_on var
    end

    def has_consent_response?
      find('input[value = true]').should be_checked
    end

    def ineligible_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}" \
        "/#{var}/pages/application#/#{var}/eligibility-result?isEligible=false"
    end

    def has_no_consent_link?
      var = participants.locale('View the consent form',
                                'Ver el formulario de consentimiento')
      expect { click_on var }
        .to raise_error(Capybara::ElementNotFound)
    end

    def click_submit_consent
      var = participants.locale('Submit', 'Enviar')
      click_on var
    end

    def has_consent_submitted_page?
      has_css? 'iframe[class = ng-scope]'
    end

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

    def english_smoking_questions
      @english_smoking_questions ||= [
        'Are you currently a smoker?',
        'Are you thinking of quitting smoking within the next 30 days?'
      ]
    end

    def spanish_smoking_questions
      @spanish_smoking_questions ||= [
        '¿Fuma usted actualmente?',
        '¿Está pensando en dejar de fumar dentro de los próximos 30 días?'
      ]
    end
  end
end
