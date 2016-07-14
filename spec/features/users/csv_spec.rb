# frozen_string_literal: true
# filename: ./spec/features/users/csv_spec.rb

Dir['./lib/csv/*.rb'].each { |file| require file }
require './lib/pages/users/csvs'

def csvs
  @csvs ||= Users::CSVs.new
end

feature 'Admin downloads, checks csv', :browser, metadata: :user do
  background(:all) { csvs.set_up }

  after(:all) { csvs.tear_down }

  scenario 'for Consent responses' do
    csvs.check_file('consent_response', ConsentResponses::HEADER)
  end

  scenario 'for Daily cigarette counts' do
    csvs.check_file('daily_cigarette_count', DailyCigaretteCount::HEADER)
  end

  scenario 'for Eligibility responses' do
    csvs.check_file('eligibility_response', EligibilityResponses::HEADER)
  end

  scenario 'for Eligibility statuses' do
    csvs.check_file('eligibility_status', EligibilityStatuses::HEADER)
  end

  scenario 'for Language choices' do
    csvs.check_file('language_choice', LanguageChoices::HEADER)
  end

  scenario 'for Page views' do
    csvs.check_file('page_view', PageView::HEADER)
  end

  scenario 'for Participants' do
    csvs.check_file('participant', ParticipantsCSV::HEADER)
  end

  scenario 'for Participant app ratings' do
    csvs.check_file('participant_app_rating', ParticipantAppRatings::HEADER)
  end

  scenario 'for Participant phones' do
    csvs.check_file('participant_phone', ParticipantPhones::HEADER)
  end

  scenario 'for Quit dates' do
    csvs.check_file('quit_date', QuitDates::HEADER)
  end

  scenario 'for Sms records' do
    csvs.check_file('sms_record', SmsRecords::HEADER)
  end
end
