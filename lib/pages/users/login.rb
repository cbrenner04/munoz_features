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

    private

    def phone_num
      @phone_num ||= users.locale('3128404100', '3128404101')
    end

    def users
      @users ||= Users.new
    end
  end
end

