# frozen_string_literal: true

require 'uuid'
require 'fileutils'
require 'csv'

module Users
  # page object for Consent
  class CSVs
    include RSpec::Matchers
    include Capybara::DSL

    def set_up
      set_download_directory
      set_driver
      sign_in_user
    end

    def tear_down
      @driver.quit
      FileUtils.rm_rf @download_dir
    end

    def check_file(report_name, headers)
      @driver.get "#{ENV['Base_URL']}/admin/#{report_name}/export?locale=en"
      @driver.find_element(css: '.btn.btn-primary').click
      file = "#{@download_dir}/#{report_name}_" \
             "#{Time.now.strftime('%Y-%m-%d_%Hh%Mm%S')}.csv"
      File.size(file).should be > 0
      CSV.read(file).include?(headers).should == true
    end

    private

    def set_download_directory
      @download_dir = File.join(Dir.pwd, UUID.new.generate)
      FileUtils.mkdir_p @download_dir
    end

    def set_driver
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile['browser.download.dir'] = @download_dir
      profile['browser.download.folderList'] = 2
      profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv'
      profile['pdfs.disabled'] = true
      @driver = Selenium::WebDriver.for :firefox, profile: profile
    end

    def sign_in_user
      @driver.get "#{ENV['Base_URL']}/users/sign_in"
      @driver.find_element(id: 'user_email').send_keys(ENV['User_1_Email'])
      @driver.find_element(id: 'user_password')
             .send_keys(ENV['User_1_Password'])
      @driver.find_element(css: '.btn.btn-primary').submit
    end
  end
end
