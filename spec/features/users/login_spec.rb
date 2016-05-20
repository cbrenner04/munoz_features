# filename: spec/features/users/landing_page_spec.rb

require './spec/support/users_helper.rb'
require './lib/pages/users/login'

def user_login
  @user_login ||= Users::Login.new(
    locale: 'english'
  )
end

feature 'A visitor to the site', metadata: :user do
  scenario 'is a registered users' do
    user_1.sign_in

    expect(user_login).to have_admin_page_visible
  end

  scenario 'is not a registered user, cannot sign in' do
    user_fake.sign_in

    expect(user_login).to have_invalid_email_or_password
  end

  scenario 'is a registered user and resets their password' do
    visit user_2.user_sign_in_page
    user_login.click_forgot_password
    user_2.fill_in_email
    user_login.click_send_pw_instructions

    expect(user_login).to have_pw_instructions_sent_message
  end

  scenario 'is a registered user who locks their account' do
    18.times do
      visit user_3.user_sign_in_page
      user_3.fill_in_email
      user_3.bad_password
      user_3.click_sign_in
      expect(user_login).to have_invalid_email_or_password
    end
    user_3.fill_in_email
    user_3.bad_password
    user_3.click_sign_in
    expect(user_login).to have_account_will_lock_warning
    user_3.fill_in_email
    user_3.bad_password
    user_3.click_sign_in

    expect(user_login).to have_account_is_locked_message
  end

  scenario "uses 'Didn't receive unlock instructions?'" do
    visit user_4.user_sign_in_page
    user_4.click_sign_in

    expect(user_login).to have_sign_in_header

    user_login.click_didnt_receive_unlock_instructions

    expect(user_login).to have_resend_unlock_instructions_header

    user_4.fill_in_email
    user_login.click_resend_unlock_instructions

    expect(user_login).to have_unlock_instructions_sent_message
  end
end
