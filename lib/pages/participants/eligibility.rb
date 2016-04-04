require './lib/pages/participants'

class Participants
  # page object for Eligibility
  class Eligibility
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(eligibility)
      @locale ||= eligibility[:locale]
      @email ||= eligibility[:email]
      @phone ||= eligibility[:phone]
      @password ||= eligibility[:password]
      @smoke ||= eligibility[:smoke]
      @age ||= eligibility[:age]
    end

    def eligibility_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#{var}/pages/application#/#{var}/eligibility"
    end

    def find_age
      var = participants.locale('How old are you?', '¿Cuántos años tiene?')
      find('.ng-binding', text: var)
    end

    def set_age_25
      first('input[type = tel]').set(@age)
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

    def click_submit
      find('input[type = submit]').click
    end

    def click_view_consent
      var = participants.locale('View the consent form',
                                'Ver el formulario de consentimiento')
      click_on var
    end

    def ineligible_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}" \
        "/#{var}/pages/application#/#{var}/eligibility-result?isEligible=false"
    end

    def click_eng
      click_on 'English'
    end

    def click_esp
      click_on 'Español'
    end

    def click_con
      click_on 'Continue'
    end

    def eligible?
      var = participants.locale('You are eligible to participate',
                                'Usted es eligible para participar en ' \
                                  'nuestro estudio')
      has_text? var
    end

    def ineligible?
      var = participants.locale('You are not eligible to participate'
                                'Lo sentimos. Usted no es elegible para ' \
                                  'participar en nuestro estudio. Le ' \
                                  'recomendamos los siguientes 3 recursos ' \
                                  'para dejar de fumar: ' \
                                  'espanol.smokefree.gov, 1-800-NO-BUTTS ' \
                                  '(662-8887) o es.becomeanex.org. Gracias ' \
                                  'por contestar nuestras preguntas')
      has_text? var
    end

    def submit_disabled
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    def has_error_message?
      var = participants.locale('Sorry, there was a problem. ' \
                                  'Please review your responses and try again.',
                                'Lo sentimos, hubo un problema. Por favor' \
                                  ' revise sus respuestas y vuelva a intentar.')
      has text? var
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