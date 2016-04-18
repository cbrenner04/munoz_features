require './lib/pages/participants/login'
require './lib/pages/participants/cigarette_counter'

def login_eng
  @login_eng ||= Participants::Login.new(locale: 'english')
end

def login_esp
  @login_esp ||= Participants::Login.new(locale: 'español')
end

def cigarette_counter_eng
  @cigarette_counter_eng ||= Participants::CigaretteCounter.new(
    locale: 'english'
  )
end

def cigarette_counter_esp
  @cigarette_counter_esp ||= Participants::CigaretteCounter.new(
    locale: 'español'
  )
end