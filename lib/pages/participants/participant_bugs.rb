require './lib/pages/participants'

module Participants
  # page object for Consent
  class ParticipantsBugs
    include Capybara::DSL

    def initialize(bugs)
      @locale ||= bugs[:locale]
    end

    private

    def participant
      @participant ||= Participant.new(locale: @locale)
    end
  end
end
