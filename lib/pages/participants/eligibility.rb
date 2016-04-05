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
      @current_smoker ||= eligibility[:current_smoker]
      @thinking_of_quitting ||= eligibility[:thinking_of_quitting]
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

    # update to have expect statement
    def visible?
      has_text? participants.locale('How old are you?', '¿Cuántos años tiene?')
    end

    def set_age
      input_age(@age)
    end


    def has_questions?
      var = participants.locale('Please answer the following questions to',
                                'Por favor responda las siguientes ' \
                                  'preguntas para determinar si es ' \
                                  'elegible para participar.')
      has_text? var
    end

    def answer_current_smoker
      within form_item(current_smoker_question) do
        choose_response(@current_smoker)
      end
    end

    def answer_thinking_of_quitting
      within form_item(thinking_of_quitting_question) do
        choose_response(@thinking_of_quitting)
      end
    end

    def enter_sf_zip
      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
    end

    def enter_chi_zip
      all('input[type = tel]')[1].set(ZipCodes::CHI.sample)
    end

    def answer_medical_care
      # x = participants.locale(
      #   #use private method
      #   'Where do you get most of your medical care?',
      #   '¿Dónde recibe la mayor parte de su atención médica?'
      # )
      y = participants.locale('Ocean Park Health Center',
                              'Centro de Salud Ocean Park')
      within('.form-group', text: medical_question) { select y }
    end

    def has_medical_question?
      has_css?('.form-group', text: medical_question)
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
                                  'Please review your ' \
                                  'responses and try again.',
                                'Lo sentimos, hubo un problema. Por favor' \
                                  ' revise sus respuestas ' \
                                  'y vuelva a intentar.')
      has text? var
    end

    def has_account_verify?
      var = participants.locale('Thank you!  Please check your email to ' \
                                  'verify your account and continue.',
                                '¡Gracias! Por favor revise su correo ' \
                                  'electrónico para verificar su cuenta y ' \
                                  'continuar.' )
      has_text? var
    end

    private

    def form_item(item)
      find('.form_group', text: item)
    end

    def choose_response(response = 'Yes')
      choose response
    end

    def current_smoker_question
      participants.locale('Are you currently a smoker?',
                          '¿Fuma usted actualmente?')
    end

    def thinking_of_quitting_question
      participants
        .locale('Are you thinking of quitting smoking ' \
                  'within the next 30 days?',
                '¿Está pensando en dejar de fumar ' \
                  'dentro de los próximos 30 días?')
    end

    def input_age(age = 25)
      first('input[value = tel]').set(age)
    end

    def participants
      @participants ||= Participants.new(locale: @locale)
    end

    def medical_question
      @medical_question ||=
        participants
          .locale('Where do you get most of your medical care?',
                  '¿Dónde recibe la mayor parte de su atención médica?')
    end
  end
end