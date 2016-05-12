require './lib/pages/participants'

class Participants
  # Page object for Cigarette Counter page
  class CigaretteCounter
    include Capybara::DSL

    def initialize(cigarette_counter)
      @count ||= cigarette_counter[:count]
      @date ||= cigarette_counter[:date]
      @day ||= cigarette_counter[:day]
      @locale ||= cigarette_counter[:locale]
    end

    def landing_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#/#{var}/cigarette-count"
    end

    def open
      click_on title
    end

    def open_with_navbar
      participants.navigate_to(title)
    end

    def visible?
      has_text? participants.locale('How many cigarettes have you smoked?',
                                    '¿Cuántos cigarros ha fumado?')
    end

    def has_count?
      button_group.find('input[type = "tel"]').has_text? @count.to_s
    end

    def increment_count
      increment_decrement('+')
    end

    def decrement_count
      increment_decrement('-')
    end

    def has_count_in_graph?
      date_format = participants.locale(
        @date.strftime('%b %-d'),
        participants.trans_mo(@date.strftime('%-d %b.'))
      )
      find('g', text: date_format).has_text? @count.to_s
    end

    def previous_week
      find('#previous-week').click
    end

    def has_zero_count_in_graph?
      today = Date.today.strftime('%d').to_i
      if today.between?(1, 6) && has_text?('30')
        has_text?('0', count: 8)
      elsif today.between?(10, 16) || today.between?(20, 26) || today >= 30
        has_text?('0', count: 8)
      else
        has_text?('0', count: 7)
      end
    end

    def set_count
      find('.pull-left', text: @day).find('input[type = tel]').set(@count)
    end

    def done
      find('.btn-default', text: participants.locale('Done', 'Fijar')).click
    end

    def has_home_visible?
      has_text? participants.locale('Stop Smoking Guide',
                                    'Guía Para Dejar de Fumar')
    end

    private

    def title
      participants.locale('Cigarette Counter',
                          'Contador de Cigarrillos')
    end

    def button_group
      find('.pull-left', text: @day)
    end

    def increment_decrement(symbol)
      button_group.find('.btn-default', text: symbol).click
    end

    def participants
      @participants ||= Participants.new(locale: @locale)
    end
  end
end
