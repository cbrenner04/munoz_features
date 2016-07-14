# frozen_string_literal: true
# filenmae: lib/pages/users/data.rb

require './lib/pages/users'

module Users
  # page object for Login
  class Data
    include RSpec::Matchers
    include Capybara::DSL

    def click_eligibility_statuses
      within nav_option do
        click_on 'Eligibility statuses'
      end
    end

    def click_is_eligible
      find('.header', text: 'Is eligible').click
    end

    def click_ineligible_participant
      within first('.eligibility_status_row') do
        expect(page).to have_css '.label.label-danger'
        click_participant
      end
    end

    def has_flagged_ineligible_ptp?
      has_content? 'participant999@example.com'
    end

    def click_eligible_participant
      within('.eligibility_status_row', text: '105787489') do
        expect(page).to have_css '.label.label-success'
        click_participant
      end
    end

    def has_flagged_eligible_ptp?
      has_content? 'participant107@example.com'
    end

    def click_consent_responses
      within nav_option do
        click_on 'Consent responses'
      end
    end

    def click_is_consented
      find('.header', text: 'Is consented').click
    end

    def click_non_consented_ptp
      within first('.consent_response_row') do
        click_participant
      end
    end

    def not_consented?
      first('.consent_response_row').has_css? '.label.label-danger'
    end

    def has_flagged_non_consented_ptp?
      has_content? 'participant208@example.com'
    end

    def iterate_to_find_consented
      counter = 0
      until counter == 5 # this seems excessive, probably just 2 needed
        find('.header', text: 'Responded at').click
        yesterday = Date.today - 1
        break if page.has_css?('.responded_at_field.datetime_type',
                               text: yesterday.strftime('%B %d'))
        counter += 1
      end
    end

    def click_consented_ptp
      within first('.consent_response_row') do
        click_participant
      end
    end

    def has_flagged_consented_ptp?
      has_content? 'participant19@example.com'
    end

    private

    def nav_option
      first('.nav.nav-pills.nav-stacked')
    end

    def click_participant
      find('a', text: 'Participant').click
    end
  end
end
