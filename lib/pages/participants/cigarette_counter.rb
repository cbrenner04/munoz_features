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
      click_on 'Cigarette Counter'
    end

    def visible_in_eng?
      if @locale == 'english'
        has_text? 'How many cigarettes have you smoked?'
      else
        has_text? '¿Cuántos cigarros ha fumado?'
      end
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
      find('.btn.btn-default', text: 'Done').click
    end

    def has_home_visible?
      hes_text? 'Stop Smoking Guide'
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
