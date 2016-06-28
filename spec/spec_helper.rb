# filename: spec/spec_helper.rb

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'

# set driver browser
def browser
  if ENV['safari']
    :safari
  elsif ENV['firefox']
    :firefox
  else
    :chrome
  end
end

# RSpec configuration options
RSpec.configure do |config|
  config.full_backtrace = false
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.run_all_when_everything_filtered = true
  config.profile_examples = 10
  config.register_ordering(:global) do |list|
    list.sort_by do |group|
      case group.metadata[:metadata]
      when :user then 10
      else 20
      end
    end
  end
  config.before(:all, metadata: :participant) do |c|
    c.page.driver.browser.manage.window.resize_to(360, 591)
  end
  config.before(:all, metadata: :user) do |c|
    c.page.driver.browser.manage.window.resize_to(1280, 743)
  end
end

# Capybara configuration options
Capybara.configure do |config|
  config.default_wait_time = 5
  config.default_driver = :selenium
  config.register_driver :selenium do |app|
    Selenium::WebDriver::Firefox::Binary.path = ENV['firefox_path']
    Capybara::Selenium::Driver.new(app, browser: browser)
  end
  config
    .save_path = "#{ENV['Path']}/munoz_features/screenshots/"
    # .save_path = "#{ENV['Path']}/munoz_features/spec/screenshots/"
end

# capybara-screenshot configuration options
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  example.description.tr(' ', '-').gsub(/^.*\/spec\//, '')
end
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run
