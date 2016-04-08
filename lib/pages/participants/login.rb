require './lib/pages/participants'

class Participants
  # page object for Consent
  class Login
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(login)
      @locale ||= login[:locale]
    end

    private

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
