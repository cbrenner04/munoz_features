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
      has_content? participants.locale 'Your Quit Date:', 'La Fecha en que Dejará de Fumar'
    end

    def click_set_quit_date
      click_on participants.locale('Set Your Quit Date',
                                   'Elija la fecha en que dejará de fumar')
    end

    def has_quit_date_calendar?
      has_css?('.ng-binding.ng-scope', text: participants.locale('We', "Mi"))
    end

    def has_todays_date_highlighted?
      has_css?('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
    end

    def view_today
      dateviewer.view_day("#{Date.today}")
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

    def has_previous_month_in_quit_date?
      last_month = Date.today - 30
      expect(page)
        .to have_css('.ng-binding', text:
          participants.locale(last_month, trans_mo(last_month)))
    end

    def pick_next_month_date
      d = Date.parse("#{Date.today}")
      num = d.mday
      if num.between?(30, 31)
        next_month = Date.today + 27
      else
        next_month = Date.today + 32
      end
    end

    def has_next_month_in_quit_date?
      has_css?('.ng-binding', text: participants.locale(next_month,
                                                        trans_mo(next_month)))
    end

    def locate_tomorrow
      tomorrow
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end
    end

    def select_tomorrow
      datepicker.select_day("#{tomorrow}")
    end

    def has_tomorrows_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
                               text: "#{tomorrow.strftime('%-d')}")
    end

    def click_navbar
      find('.navbar-toggle').click
    end

    def click_dropdown_toggle
      find('.dropdown-toggle').click
    end

    def dropdown
      @dropdown = '.dropdown-menu'
    end

    def has_set_quit_date_in_dropdown?
      has_css?('.ng-binding', text: 'Set Your Quit Date')
    end

    def click_set_quit_date
      find('a', text: 'Set Your Quit Date').click
    end

    def has_tomorrow_header?
      has_css?('h3', text: "#{tomorrow.strftime('%B %-d, %Y')}")
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

    #def done_btn
      #@done_btn = ('.btn.btn-default', text: 'Done')
    #end

    def tomorrow
      @tomorrow = Date.today + 1
    end

    def yesterday
      @yesterday = Date.today - 1
    end

    def last_month
      @last_month = "#{last_month.strftime('%b %Y')}"
    end

    def next_month
      @next_month = "#{next_month.strftime('%b %Y')}"
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
