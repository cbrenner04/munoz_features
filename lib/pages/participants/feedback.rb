require './lib/pages/participants'

class Participants
  # page object for Consent
  class Feedback
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(feedback)
      @locale ||= feedback[:locale]
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
