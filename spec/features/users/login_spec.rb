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
end
