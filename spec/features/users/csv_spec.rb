# filename: ./spec/features/users/csv_spec.rb

require 'uuid'
require 'fileutils'
require 'csv'
Dir['./lib/csv/*.rb'].each { |file| require file }

def check_file(file, headers)
  @driver.get "#{ENV['Base_URL']}/admin/#{file}/export?locale=en"
  @driver.find_element(css: '.btn.btn-primary').click
  f = "#{@download_dir}/#{file}_#{Time.now.strftime('%Y-%m-%d_%Hh%Mm%S')}.csv"
  File.size(f).should be > 0
  csv_data = CSV.read(f)
  csv_data.include?(headers).should == true
end

feature 'Admin downloads, checks csv', :browser, metadata: :user do
  background(:all) do
    @download_dir = File.join(Dir.pwd, UUID.new.generate)
    FileUtils.mkdir_p @download_dir

    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.download.dir'] = @download_dir
    profile['browser.download.folderList'] = 2
    profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv'
    profile['pdfs.disabled'] = true
    @driver = Selenium::WebDriver.for :firefox, profile: profile

    @driver.get "#{ENV['Base_URL']}/users/sign_in"
    @driver.find_element(id: 'user_email').send_keys(ENV['User_1_Email'])
    @driver.find_element(id: 'user_password').send_keys(ENV['User_1_Password'])
    @driver.find_element(css: '.btn.btn-primary').submit
  end

  after(:all) do
    @driver.quit
    FileUtils.rm_rf @download_dir
  end

  scenario 'for Consent responses' do
    check_file('consent_response', ConsentResponses::HEADER)
  end

  scenario 'for Daily cigarette counts' do
    check_file('daily_cigarette_count', DailyCigaretteCount::HEADER)
  end

  scenario 'for Eligibility responses' do
    check_file('eligibility_response', EligibilityResponses::HEADER)
  end

  scenario 'for Eligibility statuses' do
    check_file('eligibility_status', EligibilityStatuses::HEADER)
  end

  scenario 'for Language choices' do
    check_file('language_choice', LanguageChoices::HEADER)
  end

  scenario 'for Page views' do
    check_file('page_view', PageView::HEADER)
  end

  scenario 'for Participants' do
    check_file('participant', ParticipantsCSV::HEADER)
  end

  scenario 'for Participant app ratings' do
    check_file('participant_app_rating', ParticipantAppRatings::HEADER)
  end

  scenario 'for Participant phones' do
    check_file('participant_phone', ParticipantPhones::HEADER)
  end

  scenario 'for Quit dates' do
    check_file('quit_date', QuitDates::HEADER)
  end

  scenario 'for Sms records' do
    check_file('sms_record', SmsRecords::HEADER)
  end
end
