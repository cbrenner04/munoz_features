# filename: ./spec/features/users/data_spec.rb

require './spec/support/users_helper.rb'
require './lib/pages/users/data'

def user_data
  @user_data ||= Users::Data.new
end

feature 'A user signs in', metadata: :user do
  background do
    user_1.sign_in
  end

  scenario 'sees an ineligible participant flagged accordingly' do
    user_data.click_eligibility_statuses
    user_data.click_is_eligible
    user_data.click_ineligible_participant

    expect(user_data).to have_flagged_ineligible_ptp
  end

  scenario 'sees an eligible participant flagged accordingly' do
    user_data.click_eligibility_statuses
    user_data.click_is_eligible
    user_data.click_eligible_participant

    expect(user_data).to have_flagged_eligible_ptp
  end

  scenario 'sees a non-consented participant flagged accordingly' do
    user_data.click_consent_responses

    user_data.click_is_consented
    user_data.click_non_consented_ptp

    expect(user_data).to have_flagged_non_consented_ptp
  end

  scenario 'sees a consented participant flagged accordingly' do
    user_data.click_consent_responses
    user_data.iterate_to_find_consented
    user_data.click_consented_ptp

    expect(user_data).to have_flagged_consented_ptp
  end
end
