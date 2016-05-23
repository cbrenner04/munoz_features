# filename: ./spec/features/users/user_bugs_spec.rb

require './spec/support/users_helper.rb'
require './lib/pages/users/user_bugs'

def user_bugs
  @user_bugs ||= Users::Bugs.new
end

feature 'A user signs in', metadata: :user do
  background do
    user_1.sign_in
  end

  scenario 'sees responses to health clinic questions' do
    user_bugs.click_eligibility_questions
    user_bugs.click_medical_treatment_icon
    user_bugs.click_eligibility_responses

    expect(user_bugs).to have_eligibility_responses_visible

    user_bugs.click_answer_field
    user_bugs.click_eligibility_question_icon
    user_bugs.click_eligibility_answer

    expect(user_bugs).to have_eligibility_answer_visible

    expect(user_bugs).to have_chinatown
  end
end
