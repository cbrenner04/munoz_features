# filenmae: lib/pages/users/login.rb

require './lib/pages/users'

class Users
  # page object for Login
  class Login
    include RSpec::Matchers
    include Capybara::DSL

    def initialize(login)
      @locale ||= login[:locale]
    end

    def phone_confirm_time
      within('.participant_phone_row', text: phone_num) do
        time = Time.now - 2 * 60 * 60

        expect(page).to have_content time.strftime('%B %d, %Y %H')
      end
    end

    def reminder_90_days
      within first('.notification_schedule_row') do
        three = Date.today + 90

        expect(page).to have_content three.strftime('%B %d, %Y')
      end
    end

    def reminder_60_days
      row = all('.notification_schedule_row')
      within row[1] do
        two = Date.today + 60

        expect(page).to have_content two.strftime('%B %d, %Y')
      end
    end

    def reminder_30_days
      row = all('.notification_schedule_row')
      within row[2] do
        one = Date.today + 30

        expect(page).to have_content one.strftime('%B %d, %Y')
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

    def has_account_will_lock_warning?
      has_content? 'You have one more attempt before your account is locked.'
    end

    def has_account_is_locked_message?
      has_content? 'Your account is locked.'
    end

    def has_sign_in_header?
      has_css?('h2', text: 'Sign in')
    end

    def click_didnt_receive_unlock_instructions
      click_on "Didn't receive unlock instructions?"
    end

    def has_resend_unlock_instructions_header?
      has_css?('h2', text: 'Resend unlock instructions')
    end

    def click_resend_unlock_instructions
      click_on 'Resend unlock instructions'
    end

    def has_unlock_instructions_sent_message?
      has_content? 'You will receive an email with ' \
                   'instructions for how to unlock your ' \
                   'account in a few minutes.'
    end

    private

    def phone_num
      @phone_num ||= users.locale('3128404100', '3128404101')
    end

    def users
      @users ||= Users.new(locale: @locale)
    end
  end
end
