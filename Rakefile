# filename: Rakefile

require './spec/env_variables'

# load development version of app locally

desc "Set up and start 'Stop Smoking SF' for testing locally"

task :load_app_local do
  Dir.chdir("/Users/#{ENV['sys_user']}/Work/munoz") do
    system('rake db:drop db:create db:migrate')
    system('FIXTURES_PATH=spec/selenium_fixtures rake db:fixtures:load')
    system('rails s')
  end
end
