# filename: spec/features/users/landing_page_spec.rb

describe 'A visitor to the site', type: :feature do
  before do
    page.driver.browser.manage.window.resize_to(1280, 743)

    visit "#{ENV['Base_URL']}/admin"
  end

  it 'is a registered users' do
    fill_in 'user_email', with: ENV['User_1_Email']
    fill_in 'user_password', with: ENV['User_1_Password']
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    visit "#{ENV['Base_URL']}/admin"
    expect(page).to have_css('h1', text: 'Site Administration')
  end

  it 'is not a registered user, cannot sign in' do
    fill_in 'user_email', with: 'fake@example.com'
    fill_in 'user_password', with: 'fake password'
    click_on 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end

  it 'is a registered user and resets their password' do
    click_on 'Forgot your password?'
    fill_in 'user_email', with: ENV['User_2_Email']
    click_on 'Send me reset password instructions'
    expect(page).to have_content 'You will receive an email with ' \
                                 'instructions on how to reset your ' \
                                 'password in a few minutes.'
  end

  it 'is a registered user who locks their account' do
    18.times do
      fill_in 'user_email', with: ENV['User_3_Email']
      fill_in 'user_password', with: 'whoops'
      click_on 'Sign in'
      expect(page).to have_content 'Invalid email or password.'
    end

    fill_in 'user_email', with: ENV['User_3_Email']
    fill_in 'user_password', with: 'whoops'
    click_on 'Sign in'
    expect(page).to have_content 'You have one more attempt before your ' \
                                 'account is locked.'

    fill_in 'user_email', with: ENV['User_3_Email']
    fill_in 'user_password', with: 'whoops'
    click_on 'Sign in'
    expect(page).to have_content 'Your account is locked.'
  end

  it "uses 'Didn't receive unlock instructions?'" do
    click_on 'Sign in'
    find('h2', text: 'Sign in')
    click_on "Didn't receive unlock instructions?"
    find('h2', text: 'Resend unlock instructions')
    fill_in 'user_email', with: ENV['User_4_Email']
    click_on 'Resend unlock instructions'
    expect(page).to have_content 'You will receive an email with ' \
                                 'instructions for how to unlock your ' \
                                 'account in a few minutes.'
  end
end
