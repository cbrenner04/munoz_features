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
      @locale == 'english' ? var = 'en' : var = 'es'
      "#{ENV['Base_URL']}/#/#{var}/cigarette-count"
    end

    def open
      if @locale == 'english'
        click_on 'Cigarette Counter'
      else
        click_on 'Contador de Cigarrillos'
      end
    end

    def visible_in_eng?
      has_text? 'How many cigarettes have you smoked?'
    end

    def visible_in_esp?
      has_text? '¿Cuántos cigarros ha fumado?'
    end

    def has_count?
      button_group.find('input[type = tel]')
        .has_text? @count.to_s
    end

    def has_count_in_graph?
      find('g', text: @date.strftime('%b %-d'))
        .has_text? @count.to_s
    end

    def increment_count
      increment_decrement('+')
    end

    def decrement_count
      increment_decrement('-')
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
      find('.pull-left', text: @day)
        .find('input[type = tel]').set(@count)
    end

    def done
      @locale == 'english' ? btn_text = 'Done' : btn_text = 'Fijar'
      find('.btn-default', text: btn_text).click
    end

    def has_home_visible?
      if @locale == 'english'
        hes_text? 'Stop Smoking Guide'
      else
        has_text? 'Guía Para Dejar de Fumar'
      end
    end

    private

    def button_group
      find('.pull-left', text: @day)
    end

    def increment_decrement(symbol)
      button_group.find('.btn-default', text: symbol).click
    end
  end
end
