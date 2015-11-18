# filename: ./spec/features/users/user_bugs_spec.rb

describe 'A user signs in', type: :feature, metadata: :user do
  before do
    visit "#{ENV['Base_URL']}/admin"
    fill_in 'user_email', with: ENV['User_1_Email']
    fill_in 'user_password', with: ENV['User_1_Password']
    click_on 'Sign in'
    expect(page).to have_css('h1', text: 'Site Administration')
  end

  it 'sees responses to health clinic questions' do
    within('.nav.nav-pills.nav-stacked') do
      click_on 'Eligibility questions'
    end

    within('.eligibility_question_row', text: 'Where do you get') do
      find('.icon-info-sign').click
    end

    find('.well', text: 'Where do you get most of your medical care?')
    eligibility_question = find('.breadcrumb').find('.active').text

    within('.nav.nav-pills.nav-stacked') do
      click_on 'Eligibility responses'
    end

    find('h1', text: 'List of Eligibility responses')
    first('.answer_field').click
    within first('.eligibility_response_row', text: eligibility_question) do
      find('.icon-info-sign').click
    end

    find('a', text: 'EligibilityAnswer').click
    find('h1', text: 'Details for Eligibility answer')
    expect(page).to have_css('.well', text: 'Chinatown')
  end
end
