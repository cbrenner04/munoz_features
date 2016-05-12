require './lib/pages/participants'

class Participants
  # page object for Consent
  class StopSmokingGuide
    include Capybara::DSL

    def initialize(guide)
      @locale ||= guide[:locale]
    end

    def visible?
      has_text? title
    end

    def open_with_navbar
      participants.navigate_to(title)
    end

    def click_stop_smoking_guide
      click_on title
    end

    def stop_smoking_guide_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#/#{var}/stop-smoking-guide"
    end

    def click_how_to_help_someone
      click_on how_to_help_someone
    end

    def has_how_to_help_someone_visible?
      has_css?('h3', how_to_help_someone)
    end

    def has_how_to_help_1_title?
      has_css?('h4', text: participants.locale('How to help page 1 title',
                                               'Como ayudar página 1 título'))
    end

    def has_how_to_help_2_title?
      has_css?('h4', text: participants.locale('How to help page 2 title',
                                               'Como ayudar página 2 título'))
    end

    def has_how_to_help_3_title?
      has_css?('h4', text: participants.locale('How to help page 3 title',
                                               'Como ayudar página 3 título'))
    end

    def has_how_to_help_body?
      has_content? participants.locale('How to help page 1 body',
                                       'Como ayudar página 1 cuerpo')
    end

    def click_next
      find('a', text: participants.locale('Next', 'Sig.')).click
    end

    def click_how_can_i_quit
      click_on how_can_i_quit
    end

    def has_how_to_quit_guide_visible?
      has_css?('h3', text: how_can_i_quit)
    end

    def has_how_to_quit_1_title?
      has_css?('h4', text: participants.locale('How to quit page 1 title',
                                               'Cómo dejar de fumar ' \
                                                 'página 1 título'))
    end

    def has_how_to_quit_2_title?
      has_css?('h4', text: participants.locale('How to quit page 2 title',
                                               'Cómo dejar de fumar ' \
                                                 'página 2 título'))
    end

    def has_how_to_quit_3_title?
      has_css?('h4', text: participants.locale('How to quit page 3 title',
                                               'Cómo dejar de fumar ' \
                                                 'página 3 título'))
    end

    def has_how_to_quit_body?
      has_content? participants.locale('How to quit page 1 body',
                                       'Cómo dejar de fumar página 1 cuerpo')
    end

    def has_how_to_quit_body_3?
      has_content? participants.locale('How to quit page 3 body',
                                       'Cómo dejar de fumar página 3 cuerpo')
    end

    def has_what_if_1_title?
      has_css?('h4', text: participants.locale('What if? page 1 title',
                                               '¿Y sí? página 1 título'))
    end

    def has_what_if_2_title?
      has_css?('h4', text: participants.locale('What if? page 2 title',
                                               '¿Y sí? página 2 título'))
    end

    def has_what_if_3_title?
      has_css?('h4', text: participants.locale('What if? page 3 title',
                                               '¿Y sí? página 3 título'))
    end

    def click_what_if_i_start_again
      click_on what_if_i_start_smoking_again
    end

    def has_what_if_guide_visible?
      has_css?('h3', text: what_if_i_start_smoking_again)
    end

    def has_what_if_body?
      has_content? participants.locale('What if? page 1 body',
                                       '¿Y sí? página 1 cuerpo')
    end

    def click_why_quit
      click_on why_should_i_quit
    end

    def has_why_quit_visible?
      has_css?('h3', text: why_should_i_quit)
    end

    def has_why_quit_1_title?
      has_css?('h4', text: participants.locale('Why Quit? page 1 title',
                                               '¿Por qué dejar de fumar? ' \
                                                 'página 1 título'))
    end

    def has_why_quit_2_title?
      has_css?('h4', text: participants.locale('Why Quit? page 2 title',
                                               '¿Por qué dejar de fumar? ' \
                                                 'página 2 título'))
    end

    def has_why_quit_3_title?
      has_css?('h4', text: participants.locale('Why Quit? page 3 title',
                                               '¿Por qué dejar de fumar? ' \
                                                 'página 3 título'))
    end

    def has_why_quit_body?
      has_content? participants.locale('Why Quit? page 1 body',
                                       '¿Por qué dejar de fumar? ' \
                                         'página 1 cuerpo')
    end

    private

    def how_to_help_someone
      @how_to_help_someone ||=
        participants.locale('How Do I Help Someone Quit?',
                            '¿Cómo puedo ayudar a alguien dejar de fumar?')
    end

    def how_can_i_quit
      @how_can_i_quit ||=
        participants.locale('How Can I Quit?', '¿Cómo puedo dejar de fumar?')
    end

    def what_if_i_start_smoking_again
      @what_if_i_start_smoking_again ||=
        participants.locale('What if I Start Smoking Again',
                            '¿Y si empiezo a fumar de nuevo?')
    end

    def why_should_i_quit
      @why_should_i_quit ||=
        participants.locale('Why Should I Quit?',
                            '¿Por qué debo dejar de fumar?')
    end

    def participants
      @participants ||= Participants.new(locale: @locale)
    end

    def title
      participants.locale('Stop Smoking Guide',
                          'Guía Para Dejar de Fumar')
    end
  end
end
