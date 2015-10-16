# filename: ./spec/features/users/data_spec.rb

describe 'A user signs in', type: :feature, metadata: :user do
  before do
    visit "#{ENV['Base_URL']}/admin"
    fill_in 'user_email', with: ENV['User_1_Email']
    fill_in 'user_password', with: ENV['User_1_Password']
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_css('h1', text: 'Site Administration')
  end

  it 'sees an ineligible participant flagged accordingly'

  it 'sees an eligible participant flagged accordingly'

  it 'sees a non-consented participant flagged accordingly' do
    within('.nav.nav-pills.nav-stacked') do
      click_on 'Consent responses'
    end

    find('.header', text: 'Is consented').click
    within first('.consent_response_row') do
      expect(page).to have_css '.label.label-danger'
      find('a', text: 'Participant').click
    end

    expect(page).to have_content 'participant208@example.com'
  end

  it 'sees a consented participant flagged accordingly' do
    within('.nav.nav-pills.nav-stacked') do
      click_on 'Consent responses'
    end

    x = 0
    until x == 5
      find('.header', text: 'Responded at').click
      yesterday = Date.today - 1
      break if page.has_css?('.responded_at_field.datetime_type',
                             text: "#{yesterday.strftime('%B %d')}")
      x += 1
    end

    within first('.consent_response_row') do
      find('a', text: 'Participant').click
    end

    expect(page).to have_content 'participant19@example.com'
  end
end
