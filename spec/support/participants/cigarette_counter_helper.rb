# filename: ./spec/support/participants/cigerette_counter.rb

require './lib/pages/participants/cigarette_counter'
require './lib/pages/participants/set_your_quit_date'


def cigarette_counter
  @cigarette_counter ||= Participants::CigaretteCounter.new(
  	count: 'fake'
  )
end

def set_your_quit_date
	@set_your_quit_date ||= Participants::SetYourQuitDate.new
end

def pt_17_cig_counter
	@pt_17_cig_counter ||= Participants::CigaretteCounter.new(
		count: 15,
		date: Date.today - 1,
		day: 'Yesterday', 
		locale: english
	)
end

def pt_18_cig_counter
	@pt_18_cig_counter ||= Participants::CigaretteCounter.new(
		count: 16,
		date: Date.today - 1,
		day: 'Yesterday'
		plus_minus_day: "+", 
		locale: english
	)
end

def pt_19_cig_counter
	@pt_19_cig_counter ||= Participants::CigaretteCounter.new(
		count: 14,
		date: Date.today - 1,
		day: 'Yesterday'
		plus_minus_day: "-", 
		locale: english
	)
end

def pt_114_cig_counter
	@pt_114_cig_counter ||= Participants::CigaretteCounter.new(
		count: 15,
		date: Date.today,
		day: 'Today', 
		locale: english
	)
end

def pt_115_cig_counter
	@pt_115_cig_counter ||= Participants::CigaretteCounter.new(
		count: 16,
		date: Date.today,
		day: 'Today'
		plus_minus_day: "+", 
		locale: english
	)
end

def pt_116_cig_counter
	@pt_116_cig_counter ||= Participants::CigaretteCounter.new(
		count: 14,
		date: Date.today,
		day: 'Today'
		plus_minus_day: "-", 
		locale: english
	)
end
