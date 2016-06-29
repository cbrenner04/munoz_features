# filename: lib/pages/users.rb

# Page object for Users
class User
  include Capybara::DSL

  def initialize(users_arry)
    @user_id ||= users_arry[:user_id]
  end

  def user_sign_in_page
    "#{ENV['Base_URL']}/admin"
  end

  def fill_in_email
    fill_in 'user_email', with: ENV["User_#{@user_id}_Email"]
  end

  def sign_in
    visit user_sign_in_page
    fill_in_email
    fill_in 'user_password', with: ENV["User_#{@user_id}_Password"]
    click_on 'Sign in'
  end

  def notification_sched_page
    "#{ENV['Base_URL']}/admin/notification_schedule"
  end

  # TO DO: make global so both the participants and users can share
  def resize_to_mobile
    page.driver.browser.manage.window.resize_to(360, 591)
  end

  # TO DO: make global so both the participants and users can share
  def resize_to_desktop
    page.driver.browser.manage.window.resize_to(1280, 743)
  end

  def click_on_ptp_phones
    within('.nav.nav-pills.nav-stacked') { click_on 'Participant phones' }
  end
end
