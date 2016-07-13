# frozen_string_literal: true
# filenmae: lib/pages/users/login.rb

module Users
  # page object for Login
  class Login
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(login)
      @locale ||= login[:locale]
    end

    def phone_confirm_time
      phone_num = @locale == 'english' ? '3128404100' : '3128404101'
      within('.participant_phone_row', text: phone_num) do
        time = Time.now - 2 * ONE_HOUR

        expect(page).to have_content time.strftime('%B %d, %Y %H')
      end
    end

    ONE_HOUR = 60 * 60
    TODAY = Date.today

    def reminder_90_days
      within first('.notification_schedule_row') do
        ninety_days_date = TODAY + 90

        expect(page).to have_content ninety_days_date.strftime('%B %d, %Y')
      end
    end

    def reminder_60_days
      within row[1] do
        sixty_days_date = TODAY + 60

        expect(page).to have_content sixty_days_date.strftime('%B %d, %Y')
      end
    end

    def reminder_30_days
      within row[2] do
        thirty_days_date = TODAY + 30

        expect(page).to have_content thirty_days_date.strftime('%B %d, %Y')
      end
    end

    def has_admin_page_visible?
      has_content? 'Site Administration'
    end

    def has_invalid_email_or_password?
      has_text? 'Invalid email or password'
    end

    def click_forgot_password
      click_on 'Forgot your password?'
    end

    def click_send_pw_instructions
      click_on 'Send me reset password instructions'
    end

    def has_pw_instructions_sent_message?
      have_content 'You will receive an email with ' \
                   'instructions on how to reset your ' \
                   'password in a few minutes.'
    end

    private

    def row
      all('.notification_schedule_row')
    end
  end
end
