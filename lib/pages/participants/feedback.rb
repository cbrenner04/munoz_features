require './lib/pages/participants'

class Participants
  # page object for Consent
  class Feedback
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(feedback)
      @locale ||= feedback[:locale]
    end

    def find_stop_smoking_guide
      var = participants.locale('Stop Smoking Guide',
                                'Guía Para Dejar de Fumar')
      find('a', text: var)
    end

    def visible?
      var = participants.locale('How helpful was this app?',
                                '¿Qué tan útil fue esta aplicación?')
      has_content? var
    end

    def feedback_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#/#{var}/feedback"
    end

    def open_with_navbar
      participants.navigate_to(title)
    end

    def has_count_0?
      has_css? counter, count: 0
    end

    def has_count_2?
      has_css? counter, count: 2
    end

    def click_btn_2
      all(button)[3].click
    end

    def click_btn_16
      all(button)[17].click
    end

    def counter_1_has_3
      within first(counter) do
        expect(page).to have_content '3'
      end
    end

    def counter_2_has_6
      within all(counter)[1] do
        expect(page).to have_content '6'
      end
    end

    def submit
      var = participants.locale('Submit', 'Enviar')
      find('.btn.btn-primary', text: var).click
    end

    def click_navbar
      find('.navbar-toggle').click
    end

    def find_settings_cog
      find('.glyphicon.glyphicon-cog')
    end

    def has_no_feedback_link?
      has_no_css? '.ng-binging', text: title
    end

    private

    def button
      @button = '.btn.btn-default'
    end

    def counter
      @counter = '.btn.btn-default.ng-binding.ng-scope.active'
    end

    def title
      participants.locale('Feedback',
                          'Comentarios')
    end

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
