require './lib/pages/participants/stop_smoking_guide'
require './lib/pages/participants/cigarette_counter'
require './lib/pages/participants/quit_date'

def stop_smoking_guide_eng
  @stop_smoking_guide_eng ||= Participants::StopSmokingGuide.new(
    locale: 'english'
  )
end

def stop_smoking_guide_esp
  @stop_smoking_guide_esp ||= Participants::StopSmokingGuide.new(
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

def quit_date_eng
  @quit_date_eng ||= Participants::QuitDate.new(locale: 'english')
end

def quit_date_esp
  @quit_date_esp ||= Participants::QuitDate.new(locale: 'español')
end

# Participants POM methods

def participant_117
  @participant_117 ||= Participants.new(
    pt_id: 117,
    locale: 'english'
  )
end

def participant_126
  @participant_126 ||= Participants.new(
    pt_id: 126,
    locale: 'english'
  )
end

def participant_118
  @participant_118 ||= Participants.new(
    pt_id: 118,
    locale: 'english'
  )
end

def participant_119
  @participant_119 ||= Participants.new(
    pt_id: 119,
    locale: 'english'
  )
end

def participant_127
  @participant_127 ||= Participants.new(
    pt_id: 127,
    locale: 'english'
  )
end

def participant_120
  @participant_120 ||= Participants.new(
    pt_id: 120,
    locale: 'english'
  )
end

def participant_121
  @participant_121 ||= Participants.new(
    pt_id: 121,
    locale: 'english'
  )
end

def participant_128
  @participant_128 ||= Participants.new(
    pt_id: 128,
    locale: 'english'
  )
end

def participant_122
  @participant_122 ||= Participants.new(
    pt_id: 122,
    locale: 'english'
  )
end

def participant_123
  @participant_123 ||= Participants.new(
    pt_id: 123,
    locale: 'english'
  )
end

def participant_129
  @participant_129 ||= Participants.new(
    pt_id: 129,
    locale: 'english'
  )
end

def participant_124
  @participant_124 ||= Participants.new(
    pt_id: 124,
    locale: 'english'
  )
end

def participant_125
  @participant_125 ||= Participants.new(
    pt_id: 125,
    locale: 'english'
  )
end

def participant_130
  @participant_130 ||= Participants.new(
    pt_id: 130,
    locale: 'english'
  )
end

# Spanish

def participant_217
  @participant_217 ||= Participants.new(
    pt_id: 217,
    locale: 'español'
  )
end

def participant_226
  @participant_226 ||= Participants.new(
    pt_id: 226,
    locale: 'español'
  )
end

def participant_218
  @participant_218 ||= Participants.new(
    pt_id: 218,
    locale: 'español'
  )
end

def participant_219
  @participant_219 ||= Participants.new(
    pt_id: 219,
    locale: 'español'
  )
end

def participant_227
  @participant_227 ||= Participants.new(
    pt_id: 227,
    locale: 'español'
  )
end

def participant_220
  @participant_220 ||= Participants.new(
    pt_id: 220,
    locale: 'español'
  )
end

def participant_221
  @participant_221 ||= Participants.new(
    pt_id: 221,
    locale: 'español'
  )
end

def participant_228
  @participant_228 ||= Participants.new(
    pt_id: 228,
    locale: 'español'
  )
end

def participant_222
  @participant_222 ||= Participants.new(
    pt_id: 222,
    locale: 'español'
  )
end

def participant_223
  @participant_223 ||= Participants.new(
    pt_id: 223,
    locale: 'español'
  )
end

def participant_229
  @participant_229 ||= Participants.new(
    pt_id: 229,
    locale: 'español'
  )
end

def participant_224
  @participant_224 ||= Participants.new(
    pt_id: 224,
    locale: 'español'
  )
end

def participant_225
  @participant_225 ||= Participants.new(
    pt_id: 225,
    locale: 'español'
  )
end

def participant_230
  @participant_230 ||= Participants.new(
    pt_id: 230,
    locale: 'español'
  )
end
