# filename: spec/features/users/landing_page_spec.rb

describe 'A visitor to the site', type: :feature do
  it 'is a registered users' do
    visit "#{ENV['Base_URL']}/admin"
    fill_in 'user_email', with: ENV['User_1_Email']
    fill_in 'user_password', with: ENV['User_1_Password']
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_css('h1', text: 'Site Administration')
  end
end
