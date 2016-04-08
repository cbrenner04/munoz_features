require './lib/pages/participants'

class Participants
  # page object for Consent
  class StopSmokingGuide
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(guide)
      @locale ||= guide[:locale]
    end

    def visible?
      var = participants.locale('Why Should I Quit?',
                                '¿Por qué debo dejar de fumar?')
      has_text? var
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
