# frozen_string_literal: true
require './lib/pages/participants/quit_date'
require './lib/pages/participants/cigarette_counter'

def quit_date_eng
  @quit_date_eng ||= Participants::QuitDate.new(locale: 'english')
end

def quit_date_esp
  @quit_date_esp ||= Participants::QuitDate.new(locale: 'español')
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

def participant_133
  @participant_133 ||= Participant.new(
    pt_id: 133,
    locale: 'english'
  )
end

def participant_134
  @participant_134 ||= Participant.new(
    pt_id: 134,
    locale: 'english'
  )
end

def participant_135
  @participant_135 ||= Participant.new(
    pt_id: 135,
    locale: 'english'
  )
end

def participant_136
  @participant_136 ||= Participant.new(
    pt_id: 136,
    locale: 'english'
  )
end

def participant_137
  @participant_137 ||= Participant.new(
    pt_id: 137,
    locale: 'english'
  )
end

def participant_139
  @participant_139 ||= Participant.new(
    pt_id: 139,
    locale: 'english'
  )
end

def participant_149
  @participant_149 ||= Participant.new(
    pt_id: 149,
    locale: 'english'
  )
end

def participant_154
  @participant_154 ||= Participant.new(
    pt_id: 154,
    locale: 'english'
  )
end

def participant_150
  @participant_150 ||= Participant.new(
    pt_id: 150,
    locale: 'english'
  )
end

def participant_141
  @participant_141 ||= Participant.new(
    pt_id: 141,
    locale: 'english'
  )
end

def participant_142
  @participant_142 ||= Participant.new(
    pt_id: 142,
    locale: 'english'
  )
end

def participant_160
  @participant_160 ||= Participant.new(
    pt_id: 160,
    locale: 'english'
  )
end

def participant_254
  @participant_254 ||= Participant.new(
    pt_id: 254,
    locale: 'english'
  )
end

# spanish

def participant_233
  @participant_233 ||= Participant.new(
    pt_id: 233,
    locale: 'español'
  )
end

def participant_234
  @participant_234 ||= Participant.new(
    pt_id: 234,
    locale: 'español'
  )
end

def participant_235
  @participant_235 ||= Participant.new(
    pt_id: 235,
    locale: 'español'
  )
end

def participant_236
  @participant_236 ||= Participant.new(
    pt_id: 236,
    locale: 'español'
  )
end

def participant_237
  @participant_237 ||= Participant.new(
    pt_id: 237,
    locale: 'español'
  )
end

def participant_241
  @participant_241 ||= Participant.new(
    pt_id: 241,
    locale: 'español'
  )
end

def participant_239
  @participant_239 ||= Participant.new(
    pt_id: 239,
    locale: 'español'
  )
end

def participant_249
  @participant_249 ||= Participant.new(
    pt_id: 249,
    locale: 'español'
  )
end

def participant_250
  @participant_250 ||= Participant.new(
    pt_id: 250,
    locale: 'español'
  )
end

def participant_242
  @participant_242 ||= Participant.new(
    pt_id: 242,
    locale: 'español'
  )
end

def participant_260
  @participant_260 ||= Participant.new(
    pt_id: 260,
    locale: 'español'
  )
end
