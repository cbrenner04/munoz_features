# filename: ./spec/support/participants/cigerette_counter.rb

require './lib/pages/participants/cigarette_counter'

def cigarette_counter
  @cigarette_counter ||= Participants::CigaretteCounter.new
end

def set_your_quit_date
	@set_your_quit_date ||= Participants::SetYourQuitDate.new
end
