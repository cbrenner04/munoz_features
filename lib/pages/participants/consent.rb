require './lib/pages/participants'

class Participants
  # page object for Consent
  class Consent
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(consent)
        @locale ||= consent[:locale]
        @email ||= consent[:email]
        @phone ||= consent[:phone]
        @password ||= consent[:password]
    end

    def eligibility_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#{var}/pages/application#/#{var}/eligibility"
    end

    def visible?
      var = participants.locale('PALO ALTO UNIVERSITY CONSENT',
                                'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO')
      has_text? var
    end

    def set_age
      find('.ng-binding', text: 'How old are you?')
      first('input[type = tel]').set('25')
    end

    def answer_smoker
      q = ['Are you currently a smoker?',
           'Are you thinking of quitting smoking within the next 30 days?']
      q.zip(%w(Yes Yes)).each do |ques, answ|
        within('.form-group', text: ques) do
          choose answ
        end
      end
    end

    def enter_sf_zip
      all('input[type = tel]')[1].set(ZipCodes::SF.sample)
    end

    def answer_medical_care
      within('.form-group',
             text: 'Where do you get most of your medical care?') do
        select 'Ocean Park Health Center'
      end
    end

    def enter_email
      find('input[type = email]').set(@email)
    end

    def enter_phone_num
      all('input[type = tel]')[2].set(phone)
    end

    def enter_password
      find('input[type = password]').set(password)
    end

    def give_consent_check
      first('.ng-invalid-required').click
    end

    def switch_lang_btn
      go_to('Español')
    end

    def click_eligibility_submit
      find('input[type = submit]').click
    end

    def click_view_consent
      click_on 'View the consent form'
    end

    def has_consent_response?
      find('input[value = true]').should be_checked
    end

    def ineligible_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}" \
            '/#{var}/pages/application#/#{var}/eligibility-result?isEligible=false'
    end

    def has_no_view_link?
      expect { click_on 'View the consent form' }.to raise_error(Capybara::ElementNotFound)
    end

    def click_submit_consent
      click_on 'Submit'
    end

    def has_consent_submitted_page
      has_css? 'iframe[class = ng-scope]'
    end

  end
end