# filename: ./spec/support/participants/cigerette_counter.rb

require './lib/pages/participants/cigarette_counter'

def cigarette_counter
  @cigarette_counter ||= Participants::CigaretteCounter.new
end