# filename: lib/pages/users.rb

# Page object for Users
class Users
  include Capybara::DSL

  def initialize(users_arry)
    @user_id ||= users_arry[:user_id]
    @locale ||= users_arry[:locale]
  end

  def user_sign_in_page
    "#{ENV['Base_URL']}/admin"
  end

  def fill_in_email
    fill_in 'user_email', with: ENV["User_#{@user_id}_Email"]
  end

  def bad_password
    fill_in 'user_password', with: 'whoops'
  end

  def click_sign_in
    click_on 'Sign in'
  end

  def sign_in
    visit user_sign_in_page
    fill_in_email
    fill_in 'user_password', with: ENV["User_#{@user_id}_Password"]
    click_sign_in
    # find('h1', text: 'Site Administration')
  end

  def notification_sched_page
    "#{ENV['Base_URL']}/admin/notification_schedule"
  end

  def resize_to_mobile
    page.driver.browser.manage.window.resize_to(360, 591)
  end

  def resize_to_desktop
    page.driver.browser.manage.window.resize_to(1280, 743)
  end

  def click_on_ptp_phones
    within('.nav.nav-pills.nav-stacked') do
      click_on 'Participant phones'
    end
  end

  def locale(a, b)
    @locale == 'english' ? a : b
  end
end
