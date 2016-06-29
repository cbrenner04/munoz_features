require './lib/pages/participants'

module Participants
  # page object for Eligibility
  class Eligibility
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(eligibility)
      @locale ||= eligibility[:locale]
      @email ||= eligibility[:email]
      @phone ||= eligibility[:phone]
      @password ||= eligibility[:password]
      @current_smoker ||= eligibility.fetch(:current_smoker, 'Yes')
      @thinking_of_quitting ||= eligibility.fetch(:thinking_of_quitting, 'Yes')
      @age ||= eligibility[:age]
      @zip ||= eligibility.fetch(:zip, ZipCodes::SF.sample)
    end

    def eligibility_page
      var = participant.locale('en', 'es')
      "#{ENV['Base_URL']}/#{var}/pages/application#/#{var}/eligibility"
    end

    def find_age
      var = participant.locale('How old are you?', '¿Cuántos años tiene?')
      find('.ng-binding', text: var)
    end

    def visible?
      has_text? participant.locale('How old are you?', '¿Cuántos años tiene?')
    end

    def set_age
      first('input[type = tel]').set(@age)
    end

    def still_checked?
      first('input[value = true]').checked?
    end

    def has_questions?
      has_text? participant.locale('Please answer the following questions to',
                                   'Por favor responda las siguientes ' \
                                    'preguntas para determinar si es ' \
                                    'elegible para participar.')
    end

    def answer_current_smoker
      within form_item(current_smoker_question) do
        choose @current_smoker
      end
    end

    def answer_thinking_of_quitting
      within form_item(thinking_of_quitting_question) do
        choose @thinking_of_quitting
      end
    end

    def enter_zip
      all('input[type = tel]')[1].set(@zip)
    end

    def answer_medical_care
      y = participant.locale('Ocean Park Health Center',
                             'Centro de Salud Ocean Park')
      within('.form-group', text: medical_question) { select y }
    end

    def has_medical_question?
      has_css?('.form-group', text: medical_question)
    end

    def has_no_medical_question?
      has_no_content? medical_question
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
      click_on participant.locale('View the consent form',
                                  'Ver el formulario de consentimiento')
    end

    def ineligible_page
      var = participant.locale('en', 'es')
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
      click_on participant.locale('Continue', 'Continuar')
    end

    def eligible?
      has_text? participant.locale('You are eligible to participate',
                                   'Usted es eligible para participar en ' \
                                    'nuestro estudio')
    end

    def ineligible?
      has_text? participant.locale('You are not eligible to participate',
                                   'Lo sentimos. Usted no es elegible para ' \
                                    'participar en nuestro estudio. Le ' \
                                    'recomendamos los siguientes 3 recursos ' \
                                    'para dejar de fumar: ' \
                                    'espanol.smokefree.gov, 1-800-NO-BUTTS ' \
                                    '(662-8887) o es.becomeanex.org. Gracias ' \
                                    'por contestar nuestras preguntas')
    end

    def submit_disabled
      find('input[type = submit]')[:disabled].should eq 'true'
    end

    def has_error_message?
      has_text? participant.locale('Sorry, there was a problem. Please ' \
                                    'review your responses and try again.',
                                   'Lo sentimos, hubo un problema. Por ' \
                                    'favor revise sus respuestas y vuelva a ' \
                                    'intentar.')
    end

    def has_account_verify?
      has_text? participant.locale('Thank you!  Please check your email to ' \
                                    'verify your account and continue.',
                                   '¡Gracias! Por favor revise su correo ' \
                                    'electrónico para verificar su cuenta y ' \
                                    'continuar.')
    end

    # split `invalid_age`, `less_than_5_zip`, `more_than_5_zip`,
    # `invalid_email`, `invalid_phone`, and `invalid_password`
    # They didn't really make sense to me in the specs
    # and there is a lot of repeated code

    def has_empty_age_field?
      form_item(age_question).has_no_css?('.ng-invalid-pattern')
    end

    def has_invalid_age?
      form_item(age_question).has_css?('.ng-invalid-pattern')
    end

    def has_empty_zip_field?
      form_item(zip_question).has_no_css?('.ng-invalid-minlength')
    end

    def has_invalid_zip?
      form_item(zip_question).has_css?('.ng-invalid-pattern')
    end

    def has_invalid_zip_alert?
      has_text? participant
        .locale('Must be 5 digits to be valid.',
                'Debe introducir 5 dígitos para ser válido')
    end

    def has_empty_email_field?
      form_item('Email').has_no_css?('.ng-invalid-email')
    end

    def has_invalid_email?
      form_item('Email').has_css?('.ng-invalid-email')
    end

    def has_invalid_email_alert?
      has_text? participant
        .locale('Must be a valid email address.',
                'Debe introducir un correo electrónico válido')
    end

    def phone_question
      participant.locale('Phone Number', 'Teléfono')
    end

    def has_empty_phone_field?
      form_item(phone_question).has_no_css?('.ng-invalid-pattern')
    end

    def has_invalid_phone?
      form_item(phone_question).has_css?('.ng-invalid-pattern')
    end

    def has_invalid_phone_alert?
      has_text? participant
        .locale('Must be 10 digits to be valid.',
                'Debe introducir 10 dígitos para ser válido')
    end

    def has_empty_password_field?
      form_item(password).has_no_css?('.ng-invalid-minlength')
    end

    def has_invalid_password?
      form_item(password).has_css?('.ng-invalid-minlength')
    end

    def has_invalid_password_alert?
      has_text? participant
        .locale('minimum 8 characters', 'mínimo 8 caracteres')
    end

    private

    def form_item(item)
      find('.form-group', text: item)
    end

    def current_smoker_question
      participant.locale('Are you currently a smoker?',
                         '¿Fuma usted actualmente?')
    end

    def thinking_of_quitting_question
      participant.locale('Are you thinking of quitting smoking ' \
                           'within the next 30 days?',
                         '¿Está pensando en dejar de fumar ' \
                           'dentro de los próximos 30 días?')
    end

    def participant
      @participant ||= Participant.new(locale: @locale)
    end

    def medical_question
      participant
        .locale('Where do you get most of your medical care?',
                '¿Dónde recibe la mayor parte de su atención médica?')
    end

    def age_question
      participant.locale('How old are you?', '¿Cuántos años tiene?')
    end

    def zip_question
      participant.locale('What is your zip code?',
                         '¿Cuál es su código postal?')
    end

    def password
      participant.locale('Password', 'Contraseña')
    end
  end
end
