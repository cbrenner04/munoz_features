require './lib/pages/participants/login'
require './lib/pages/participants/cigarette_counter'
require './lib/pages/users/login'

def login_eng
  @login_eng ||= Participants::Login.new(locale: 'english')
end

def login_esp
  @login_esp ||= Participants::Login.new(locale: 'español')
end

def login_user_eng
  @login_user_eng ||= Users::Login.new(
    locale: 'english'
  )
end

def login_user_esp
  @login_user_esp ||= Users::Login.new(
    locale: 'español'
  )
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
