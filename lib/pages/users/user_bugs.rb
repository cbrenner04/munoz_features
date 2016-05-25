# filenmae: lib/pages/users/data.rb

require './lib/pages/users'

module Users
  # page object for Login
  class Bugs
    include RSpec::Matchers
    include Capybara::DSL

    def click_eligibility_questions
      within('.nav.nav-pills.nav-stacked') do
        click_on 'Eligibility questions'
      end
    end

    def click_eligibility_responses
      within('.nav.nav-pills.nav-stacked') do
        click_on 'Eligibility responses'
      end
      find('.well', text: 'Where do you get most of your medical care?')
      @eligibility_question ||= find('.breadcrumb').find('.active').text
    end

    def click_medical_treatment_icon
      within('.eligibility_question_row', text: 'Where do you get') do
        find('.icon-info-sign').click
      end
    end

    def has_eligibility_responses_visible?
      has_css?('h1', text: 'List of Eligibility responses')
    end

    def click_answer_field
      first('.answer_field').click
    end

    def click_eligibility_question_icon
      within first('.eligibility_response_row', text: @eligibility_question) do
        find('.icon-info-sign').click
      end
    end

    def click_eligibility_answer
      find('a', text: 'EligibilityAnswer').click
    end

    def has_eligibility_answer_visible?
      has_css?('h1', text: 'Details for Eligibility answer')
    end

    def has_chinatown?
      has_css?('.well', text: 'Chinatown')
    end
  end
end
