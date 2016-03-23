require './lib/pages/participants'
=begin
class Participants
  # page object for Eligibility
  class Consent
    include Capybara::DSL

    def initialize(consent)
        @locale ||= consent[:locale]
        @email ||= consent[:email]
    end

    def eligibility_page
      var = @locale == 'english' ? 'en' : 'es'
      "#{ENV['Base_URL']}/#/#{var}/pages/application#/#/#{var}/eligibility"
    end

    def visible?
      if @locale == 'english'
        has_text? 'PALO ALTO UNIVERSITY CONSENT'
      else
        has_text? 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
      end
    end

    def set_age
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
    end

    def smokes
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end
    end

    def enter_email
      find('input[type = email]').set(@email)
    end
  end

end

=end