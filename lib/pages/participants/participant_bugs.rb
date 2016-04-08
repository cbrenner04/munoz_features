require './lib/pages/participants'

class Participants
  # page object for Consent
  class ParticipantsBugs
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(bugs)
      @locale ||= bugs[:locale]
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
