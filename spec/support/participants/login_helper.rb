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

# Participants POM methods

def participant_generic
  @participant_113 ||= Participants.new(
    pt_id: 'gen',
  )
end

def participant_113
  @participant_113 ||= Participants.new(
    pt_id: 113,
    locale: 'english'
  )
end

def participant_112
  @participant_112 ||= Participants.new(
    pt_id: 112,
    locale: 'english'
  )
end

def participant_fake
  @participant_fake ||= Participants.new(
    pt_id: 1234,
    locale: 'english'
  )
end

def participant_110
  @participant_110 ||= Participants.new(
    pt_id: 110,
    locale: 'english'
  )
end

def participant_5
  @participant_5 ||= Participants.new(
    pt_id: 5,
    locale: 'english'
  )
end

def participant_105
  @participant_105 ||= Participants.new(
    pt_id: 105,
    locale: 'english'
  )
end

def participant_6
  @participant_6 ||= Participants.new(
    pt_id: 6,
    locale: 'english'
  )
end

def participant_111
  @participant_111 ||= Participants.new(
    pt_id: 111,
    locale: 'english'
  )
end

def participant_29
  @participant_29 ||= Participants.new(
    pt_id: 29,
    locale: 'english'
  )
end

def participant_3
  @participant_3 ||= Participants.new(
    pt_id: 3,
    locale: 'english'
  )
end

def participant_156
  @participant_156 ||= Participants.new(
    pt_id: 156,
    locale: 'english'
  )
end

#Spanish

def participant_212
  @participant_212 ||= Participants.new(
    pt_id: 212,
    locale: 'español'
  )
end

def participant_210
  @participant_210 ||= Participants.new(
    pt_id: 210,
    locale: 'español'
  )
end

def participant_8
  @participant_8 ||= Participants.new(
    pt_id: 8,
    locale: 'español'
  )
end

def participant_205
  @participant_205 ||= Participants.new(
    pt_id: 205,
    locale: 'español'
  )
end

def participant_7
  @participant_7 ||= Participants.new(
    pt_id: 7,
    locale: 'español'
  )
end

def participant_211
  @participant_211 ||= Participants.new(
    pt_id: 211,
    locale: 'español'
  )
end

def participant_30
  @participant_30 ||= Participants.new(
    pt_id: 30,
    locale: 'español'
  )
end

def participant_4
  @participant_4 ||= Participants.new(
    pt_id: 4,
    locale: 'español'
  )
end

def participant_256
  @participant_256 ||= Participants.new(
    pt_id: 256,
    locale: 'español'
  )
end
