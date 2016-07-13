# frozen_string_literal: true
require './lib/pages/participants'
require './lib/pages/participants/quit_date/datepicker'
require './lib/pages/participants/quit_date/dateviewer'

module Participants
  # Page object for set your quit date.
  class QuitDate
    include Capybara::DSL

    def initialize(quit_date)
      @locale ||= quit_date[:locale]
    end

    def quit_date_page
      var = participant.locale('en', 'es')
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
      click_on set_your_quit_date
    end

    def has_quit_date_calendar?
      has_css?('.ng-binding.ng-scope', text: participant.locale('We', 'Mi'))
    end

    def on_current_month?
      today = Date.today.strftime(std_month_year)
      has_css?('.ng-binding',
               text: participant.locale(today, participant.trans_mo(today)))
    end

    def has_todays_date_highlighted?
      dateviewer.view_day(Date.today.to_s)
    end

    def click_previous_month
      find('a', text: prev_btn).click
    end

    def click_next_month
      find('a', text: next_btn).click
    end

    def click_today_btn
      find('a', text: today_btn).click
    end

    def has_previous_month_visible?
      has_css?('.ng-binding',
               text: participant.locale(last_month,
                                        participant.trans_mo(last_month)))
    end

    def has_next_month_visible?
      has_css?('.ng-binding',
               text: participant.locale(next_month,
                                        participant.trans_mo(next_month)))
    end

    def locate_tomorrow
      t = tomorrow.strftime(std_month_year)
      unless has_css?('.ng-binding',
                      text: participant.locale(t, participant.trans_mo(t)))
        find('a', text: next_btn).click
      end
    end

    def locate_yesterday
      y = yesterday.strftime(std_month_year)
      unless has_css?('.ng-binding',
                      text: participant.locale(y, participant.trans_mo(y)))
        find('a', text: prev_btn).click
      end
    end

    def locate_two_days_away
      d = two_days_away.strftime(std_month_year)
      unless has_css?('.ng-binding',
                      text: participant.locale(d, participant.trans_mo(d)))
        find('a', text: next_btn).click
      end
    end

    def locate_beyond_4_wks_away
      w = beyond_4_wks_away.strftime(std_month_year)
      unless has_css?('.ng-binding',
                      text: participant.locale(w, participant.trans_mo(w)))
        find('a', text: next_btn).click
      end
    end

    def locate_under_4_wks_away
      w = under_4_wks_away.strftime(std_month_year)
      unless has_css?('.ng-binding',
                      text: participant.locale(w, participant.trans_mo(w)))
        find('a', text: prev_btn).click
      end
    end

    def select_tomorrow
      datepicker.select_day(tomorrow.to_s)
    end

    def select_yesterday
      datepicker.select_day(yesterday.to_s)
    end

    def select_two_days_away
      datepicker.select_day(two_days_away.to_s)
    end

    def select_beyond_4_wks_away
      datepicker.select_day(beyond_4_wks_away.to_s)
    end

    def select_under_4_wks_away
      datepicker.select_day(under_4_wks_away.to_s)
    end

    def has_tomorrows_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
               text: tomorrow.strftime('%-d'))
    end

    def has_yesterdays_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
               text: yesterday.strftime('%-d'))
    end

    def has_two_days_away_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
               text: two_days_away.strftime('%-d'))
    end

    def has_beyond_4_wks_away_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
               text: beyond_4_wks_away.strftime('%-d'))
    end

    def has_under_4_wks_away_date_highlighted?
      has_css?('.text-right.ng-binding.ng-scope.success',
               text: under_4_wks_away.strftime('%-d'))
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
      find('.dropdown-menu').has_css?('.ng-binding', text: set_your_quit_date)
    end

    def has_tomorrow_header?
      has_css?('h3', text: page_title)
      has_css?('h3', text: tomorrow.strftime('%-d'))
    end

    def has_tomorrow_header_full_month?
      has_css?('h3', text: page_title)
      has_css?('h3', text: tomorrow.strftime('%B %-d'))
    end

    def has_root_visible?
      has_css?('a', text: participant.locale('Cigarette Counter',
                                             'Contador de Cigarrillos'))
    end

    def has_set_quit_date_in_root?
      has_css?('a', text: set_your_quit_date)
    end

    def has_done_btn?
      has_css?('.btn.btn-default', text: done)
    end

    def click_done
      find('.btn.btn-default', text: done).click
    end

    def has_stop_smoking_guide?
      has_content? participant.locale('Stop Smoking Guide',
                                      'Guía Para Dejar de Fumar')
    end

    private

    # def done_btn
    #   @done_btn = ('.btn.btn-default', text: 'Done')
    # end

    def page_title
      @page_title ||= participant.locale 'Your Quit Date',
                                         'La Fecha en que Dejará de Fumar'
    end

    def set_your_quit_date
      @set_your_quit_date ||= participant.locale('Set Your Quit Date',
                                                 'Elija la fecha en ' \
                                                   'que dejará de fumar')
    end

    def tomorrow
      @tomorrow ||= Date.today + 1
    end

    def yesterday
      @yesterday ||= Date.today - 1
    end

    def two_days_away
      @two_days_away ||= Date.today + 2
    end

    def beyond_4_wks_away
      @beyond_4_wks_away ||= Date.today + 30
    end

    def under_4_wks_away
      @under_4_wks_away ||= Date.today + 25
    end

    def std_month_year
      @std_month_year ||= participant.locale('%b %Y', '%b. %Y')
    end

    def last_month
      @last_month ||=
        Date.today.prev_month.strftime(std_month_year)
    end

    def next_month
      @next_month ||=
        Date.today.next_month.strftime(std_month_year)
    end

    def participant
      @participant ||= Participant.new(locale: @locale)
    end

    def datepicker
      @datepicker ||= DatePicker.new
    end

    def dateviewer
      @dateviewer ||= DateViewer.new
    end

    def today_btn
      @today_btn ||= participant.locale('Today', 'Hoy')
    end

    def next_btn
      @next_btn ||= participant.locale('Next', 'Sig.')
    end

    def prev_btn
      @prev_btn ||= participant.locale('Prev.', 'Volver')
    end

    def done
      @done ||= participant.locale('Done', 'Fijar')
    end
  end
end
