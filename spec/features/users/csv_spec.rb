# filename: ./spec/features/users/csv_spec.rb

require 'uuid'
require 'fileutils'
require 'csv'
require_relative '../../support/headers/consent_responses.rb'
require_relative '../../support/headers/daily_cigarette_count.rb'
require_relative '../../support/headers/eligibility_responses.rb'
require_relative '../../support/headers/language_choices.rb'
require_relative '../../support/headers/participants.rb'
require_relative '../../support/headers/quit_dates.rb'
require_relative '../../support/headers/eligibility_statuses.rb'
require_relative '../../support/headers/page_view.rb'
require_relative '../../support/headers/participant_app_ratings.rb'
require_relative '../../support/headers/participant_phones.rb'
require_relative '../../support/headers/sms_records.rb'

describe 'Admin signs in', type: :feature, metadata: :user do
  before(:all) do
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

  it "navigates to 'Consent responses - export', " \
     'downloads csv, checks size and headers' do
    @driver.get "#{ENV['Base_URL']}/admin/consent_response/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(ConsentResponses::HEADER).should == true
  end

  it "navigates to 'Daily cigarette counts - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/daily_cigarette_count/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(DailyCigaretteCount::HEADER).should == true
  end

  it "navigates to 'Eligibility responses - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/eligibility_response/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(EligibilityResponses::HEADER).should == true
  end

  it "navigates to 'Eligibility statuses - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/eligibility_status/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(EligibilityStatuses::HEADER).should == true
  end

  it "navigates to 'Language choices - export', " \
     'downloads csv, checks size and headers' do
    @driver.get "#{ENV['Base_URL']}/admin/language_choice/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(LanguageChoices::HEADER).should == true
  end

  it "navigates to 'Page views - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/page_view/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(PageView::HEADER).should == true
  end

  it "navigates to 'Participants - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/participant/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(Participants::HEADER).should == true
  end

  it "navigates to 'Participant app ratings - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/participant_app_rating/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(ParticipantAppRatings::HEADER).should == true
  end

  it "navigates to 'Participant phones - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/participant_phone/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(ParticipantPhones::HEADER).should == true
  end

  it "navigates to 'Quit dates - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/quit_date/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(QuitDates::HEADER).should == true
  end

  it "navigates to 'Sms records - export', " \
     'downloads csv, checks size and headers' do
    @driver
      .get "#{ENV['Base_URL']}/admin/sms_record/export?locale=en"
    @driver.find_element(css: '.btn.btn-primary').click

    files = Dir.glob("#{@download_dir}/**")
    File.size(files.last).should be > 0
    csv_data = CSV.read(files.last)
    csv_data.include?(SmsRecords::HEADER).should == true
  end
end
