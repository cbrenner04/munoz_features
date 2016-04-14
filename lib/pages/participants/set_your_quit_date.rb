require './lib/pages/participants'

class Participants
  # Page object for set your quit date.
  class SetYourQuitDate
    include Capybara::DSL

    def initialize(quit_date)
      @locale ||= quit_date[:locale]
    end

    def visible?
      participants.locale 'Your Quit Date:', 'La Fecha en que Dejará de Fumar'
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
