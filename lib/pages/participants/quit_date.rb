require './lib/pages/participants'
require './lib/pages/participants/quit_date/datepicker'
require './lib/pages/participants/quit_date/dateviewer'

class Participants
  # Page object for set your quit date.
  class QuitDate
    include Capybara::DSL

    def initialize(quit_date)
      @locale ||= quit_date[:locale]
    end

    def quit_date_page
      var = participants.locale('en', 'es')
      "#{ENV['Base_URL']}/#/#{var}/quit-date"
    end

    def has_set_quit_date_visible?
      has_css? '.previous'
    end

    def visible?
      has_content? page_title
    end

    def click_set_quit_date
      sleep(1)
      click_on participants.locale('Set Your Quit Date',
                                   'Elija la fecha en que dejará de fumar')
    end

    def has_quit_date_calendar?
      has_css?('.ng-binding.ng-scope', text: participants.locale('We', 'Mi'))
    end

    def on_current_month?
      today = Date.today.strftime(participants.locale('%b %Y', '%b. %Y'))
      has_css?('.ng-binding',
               text: participants.locale(today, participants.trans_mo(today)))
    end

    def has_todays_date_highlighted?
      dateviewer.view_day(Date.today.to_s)
    end

    def click_previous_month
      find('a', text: participants.locale('Prev.', 'Volver')).click
    end

    def click_next_month
      find('a', text: participants.locale('Next', 'Sig.')).click
    end

    def click_today_btn
      find('a', text: 'Today').click
    end

    def has_previous_month_visible?
      has_css?('.ng-binding',
               text: participants.locale(last_month,
                                         participants.trans_mo(last_month)))
    end

    def has_next_month_visible?
      has_css?('.ng-binding',
               text: participants.locale(next_month,
                                         participants.trans_mo(next_month)))
    end

    def locate_tomorrow
      t = tomorrow.strftime(participants.locale('%b %Y', '%b. %Y'))
      unless has_css?('.ng-binding',
                      text: participants.locale(t, participants.trans_mo(t)))
        find('a', text: 'Next').click
      end
    end

    def select_tomorrow
      datepicker.select_day(tomorrow.to_s)
    end

    def has_tomorrows_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
               text: tomorrow.strftime('%-d'))
    end

    def click_navbar
      find('.navbar-toggle').click
    end

    def click_dropdown_toggle
      find('.dropdown-toggle').click
    end

    # def dropdown
    #   @dropdown ||= '.dropdown-menu'
    # end

    def has_set_quit_date_in_dropdown?
      find('.dropdown-menu').has_css?('.ng-binding', text: 'Set Your Quit Date')
    end

    def has_tomorrow_header?
      has_css?('h3', text: page_title)
      has_css?('h3', text: tomorrow.strftime('%-d'))
    end

    def has_root_visible?
      has_css?('a', text: 'Cigarette Counter')
    end

    def has_set_quit_date_in_root?
      has_css?('a', text: 'Set Your Quit Date')
    end

    def has_done_btn?
      has_css?('.btn.btn-default', text: 'Done')
    end

    def click_done
      find('.btn.btn-default', text: 'Done').click
    end

    def has_stop_smoking_guide?
      has_content? 'Stop Smoking Guide'
    end

    private

    # def done_btn
    #   @done_btn = ('.btn.btn-default', text: 'Done')
    # end

    def page_title
      @page_title ||= participants.locale 'Your Quit Date:',
                                          'La Fecha en que Dejará de Fumar:'
    end

    def tomorrow
      @tomorrow ||= Date.today + 1
    end

    def yesterday
      @yesterday ||= Date.today - 1
    end

    def last_month
      @last_month ||=
        Date.today.prev_month.strftime(participants.locale('%b %Y', '%b. %Y'))
    end

    def next_month
      @next_month ||=
        Date.today.next_month.strftime(participants.locale('%b %Y', '%b. %Y'))
    end

    def participants
      @participants ||= Participants.new(locale: @locale)
    end

    def datepicker
      @datepicker ||= DatePicker.new
    end

    def dateviewer
      @dateviewer ||= DateViewer.new
    end
  end
end
