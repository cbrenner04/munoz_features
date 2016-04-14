require './lib/pages/participants'

class Participants
  # page object for Consent
  class QuitDate
    include Capybara::DSL

    def initialize(quitdate)
      @locale ||= quitdate[:locale]
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
