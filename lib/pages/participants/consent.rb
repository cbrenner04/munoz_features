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
      find('.ng-binding', text: '#{var}')
    end

    def set_age
      first('input[type = tel]').set('25')
    end

    def answer_smoker
      ques = participants.locale(english_smoking_questions, spanish_smoking_questions)
      answ = participants.locale(%w(Yes Yes), %w(Sí, Sí))
      ques.zip(answ) { |q, a| within('.form-group', text: q) { choose a } }
    end

    def enter_sf_zip
      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
    end

    def answer_medical_care
      x = participants
        .locale('Where do you get most of your medical care?',
                '¿Dónde recibe la mayor parte de su atención médica?')
      y = participants.locale('Ocean Park Health Center', 
                              'Centro de Salud Ocean Park')
      within('.form-group', text: '#{x}') do
        select '#{y}'
      end
    end

    def enter_email
      find('input[type = email]').set(@email)
    end

    def enter_phone_num
      all('input[type = tel]')[2].set(phone)
    end

    def enter_password
      find('input[type = password]').set(password)
    end

    def give_consent
      first('.ng-invalid-required').click
    end

    def switch_lang_btn
      go_to('Español')
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

    def has_consent_submitted_page
      has_css? 'iframe[class = ng-scope]'
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
      '¿Está pensando en dejar de fumar  dentro de los próximos 30 días?'
      ]
    end
  end
end