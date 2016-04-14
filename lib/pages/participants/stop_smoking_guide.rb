require './lib/pages/participants'

class Participants
  # page object for Consent
  class StopSmokingGuide
    include Capybara::DSL

    def initialize(guide)
      @locale ||= guide[:locale]
    end

    def visible?
      has_text? title
    end

    def open_with_navbar
      participants.navigate_to(title)
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end

    def title
      participants.locale('Stop Smoking Guide',
                          'Guía Para Dejar de Fumar')
    end
  end
end
