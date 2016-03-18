class Participants
  # page object for Consent
  class Consent
    include Capybara::DSL

    def initialize(consent)
        @locale ||= consent[:locale]
    end

    def eligibility_page
      var = @locale == 'english' ? 'en' : 'es'
      "#{ENV['Base_URL']}/#/#{var}/pages/application#/#/#{var}/eligibility"
    end

    def visible_in_eng?
      has_text? 'PALO ALTO UNIVERSITY CONSENT'
    end

    def visible_in_esp?
      has_text? 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
    end

    def set_age
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
    end

  end
end