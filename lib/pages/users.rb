class Users
  include Capybara::DSL

  def sign_in
    visit "#{ENV['Base_URL']}/admin"
    fill_in 'user_email', with: ENV['User_1_Email']
    fill_in 'user_password', with: ENV['User_1_Password']
    click_on 'Sign in'
    find('h1', text: 'Site Administration')
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
end
