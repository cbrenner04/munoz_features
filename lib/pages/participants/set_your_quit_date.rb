class Participants
  # Page object for set your quit date.
  class SetYourQuitDate
    include Capybara::DSL

    def visible_in_eng?
      has_text? 'Your Quit Date:'
    end

    def visible_in_esp?
      has_text? 'La Fecha en que Dejará de Fumar'
    end
  end
end
