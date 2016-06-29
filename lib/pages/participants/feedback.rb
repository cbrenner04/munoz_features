require './lib/pages/participants'

module Participants
  # page object for Consent
  class Feedback
    include Capybara::DSL

    def initialize(feedback)
      @locale ||= feedback[:locale]
    end

    def find_stop_smoking_guide
      var = participant.locale('Stop Smoking Guide',
                               'Guía Para Dejar de Fumar')
      find('a', text: var)
    end

    def visible?
      has_text? participant.locale('How helpful was this app?',
                                   '¿Qué tan útil fue esta aplicación?')
    end

    def feedback_page
      var = participant.locale('en', 'es')
      "#{ENV['Base_URL']}/#/#{var}/feedback"
    end

    def open_with_navbar
      participant.navigate_to(title)
    end

    def has_count_0?
      has_css? counter, count: 0
    end

    def has_count_2?
      has_css? counter, count: 2
    end

    def make_first_rating
      sleep(0.25)
      all(button)[3].click # may parameterize if needed
    end

    def make_second_rating
      all(button)[17].click # may parameterize if needed
    end

    def has_first_rating?
      first(counter).has_text? '3' # may parameterize if needed
    end

    def has_second_rating?
      all(counter)[1].has_text? '6' # may parameterize if needed
    end

    def submit
      var = participant.locale('Submit', 'Enviar')
      find('.btn.btn-primary', text: var).click
    end

    def click_navbar
      find('.navbar-toggle').click
    end

    def find_settings_cog
      find('.glyphicon.glyphicon-cog')
    end

    def has_no_feedback_link?
      has_no_css? 'a', text: title
    end

    private

    def button
      @button ||= '.btn.btn-default'
    end

    def counter
      @counter ||= '.active'
    end

    def title
      participant.locale('Feedback', 'Comentarios')
    end

    def participant
      @participant ||= Participant.new(locale: @locale)
    end
  end
end
