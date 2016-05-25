# filename: ./spec/support/participants/cigerette_counter.rb

require './lib/pages/participants/cigarette_counter'
require './lib/pages/participants/quit_date'

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
  @quit_date_eng ||= Participants::QuitDate.new(
    locale: 'english'
  )
end

def quit_date_esp
  @squit_date_esp ||= Participants::QuitDate.new(
    locale: 'español'
  )
end

def pt_113_cig_counter
  @pt_113_cig_counter ||= Participants::CigaretteCounter.new(
    locale: 'english'
  )
end

def pt_132_cig_counter
  @pt_132_cig_counter ||= Participants::CigaretteCounter.new(
    locale: 'english'
  )
end

def pt_17_cig_counter
  @pt_17_cig_counter ||= Participants::CigaretteCounter.new(
    count: 15,
    date: Date.today - 1,
    day: 'Yesterday',
    locale: 'english'
  )
end

def pt_18_cig_counter
  @pt_18_cig_counter ||= Participants::CigaretteCounter.new(
    count: 16,
    date: Date.today - 1,
    day: 'Yesterday',
    locale: 'english'
  )
end

def pt_19_cig_counter
  @pt_19_cig_counter ||= Participants::CigaretteCounter.new(
    count: 14,
    date: Date.today - 1,
    day: 'Yesterday',
    locale: 'english'
  )
end

def pt_114_cig_counter
  @pt_114_cig_counter ||= Participants::CigaretteCounter.new(
    count: 15,
    date: Date.today,
    day: 'Today',
    locale: 'english'
  )
end

def pt_115_cig_counter
  @pt_115_cig_counter ||= Participants::CigaretteCounter.new(
    count: 16,
    date: Date.today,
    day: 'Today',
    locale: 'english'
  )
end

def pt_116_cig_counter
  @pt_116_cig_counter ||= Participants::CigaretteCounter.new(
    count: 14,
    date: Date.today,
    day: 'Today',
    locale: 'english'
  )
end

def pt_143_cig_counter
  @pt_143_cig_counter ||= Participants::CigaretteCounter.new(
    count: 15,
    date: Date.today - 9,
    locale: 'english'
  )
end

def pt_144_cig_counter
  @pt_144_cig_counter ||= Participants::CigaretteCounter.new(
    count: 5,
    date: Date.today - 1,
    day: 'Yesterday',
    locale: 'english'
  )
end

def pt_145_cig_counter
  @pt_145_cig_counter ||= Participants::CigaretteCounter.new(
    count: 5,
    date: Date.today,
    day: 'Today',
    locale: 'english'
  )
end

def pt_155_cig_counter
  @pt_155_cig_counter ||= Participants::CigaretteCounter.new(
    date: Date.today - 1,
    day: 'Yesterday',
    locale: 'english'
  )
end

# Espanol

def pt_213_cig_counter
  @pt_213_cig_counter ||= Participants::CigaretteCounter.new(
    count: 15,
    date: Date.today - 1,
    day: 'Ayer',
    locale: 'español'
  )
end

def pt_20_cig_counter
  @pt_20_cig_counter ||= Participants::CigaretteCounter.new(
    count: 15,
    date: Date.today - 1,
    day: 'Ayer',
    locale: 'español'
  )
end

def pt_21_cig_counter
  @pt_21_cig_counter ||= Participants::CigaretteCounter.new(
    count: 16,
    date: Date.today - 1,
    day: 'Ayer',
    locale: 'español'
  )
end

def pt_22_cig_counter
  @pt_22_cig_counter ||= Participants::CigaretteCounter.new(
    count: 14,
    date: Date.today - 1,
    day: 'Ayer',
    locale: 'español'
  )
end

def pt_214_cig_counter
  @pt_214_cig_counter ||= Participants::CigaretteCounter.new(
    count: 1,
    date: Date.today,
    day: 'Hoy',
    locale: 'español'
  )
end

def pt_215_cig_counter
  @pt_215_cig_counter ||= Participants::CigaretteCounter.new(
    count: 16,
    date: Date.today,
    day: 'Hoy',
    locale: 'español'
  )
end

def pt_216_cig_counter
  @pt_216_cig_counter ||= Participants::CigaretteCounter.new(
    count: 14,
    date: Date.today,
    day: 'Hoy',
    locale: 'español'
  )
end

def pt_243_cig_counter
  @pt_243_cig_counter ||= Participants::CigaretteCounter.new(
    count: 15,
    date: Date.today - 9,
    locale: 'español'
  )
end

def pt_244_cig_counter
  @pt_244_cig_counter ||= Participants::CigaretteCounter.new(
    count: 5,
    date: Date.today,
    day: 'Hoy',
    locale: 'español'
  )
end

def pt_245_cig_counter
  @pt_245_cig_counter ||= Participants::CigaretteCounter.new(
    count: 5,
    date: Date.today,
    day: 'Hoy',
    locale: 'español'
  )
end

def pt_255_cig_counter
  @pt_255_cig_counter ||= Participants::CigaretteCounter.new(
    date: Date.today,
    day: 'Hoy',
    locale: 'español'
  )
end

# Participants POM methods

def participant_113
  @participant_113 ||= Participant.new(
    pt_id: 113,
    locale: 'english'
  )
end

def participant_132
  @participant_132 ||= Participant.new(
    pt_id: 132,
    locale: 'english'
  )
end

def participant_17
  @participant_17 ||= Participant.new(
    pt_id: 17,
    locale: 'english'
  )
end

def participant_18
  @participant_18 ||= Participant.new(
    pt_id: 18,
    locale: 'english'
  )
end

def participant_19
  @participant_19 ||= Participant.new(
    pt_id: 19,
    locale: 'english'
  )
end

def participant_114
  @participant_114 ||= Participant.new(
    pt_id: 114,
    locale: 'english'
  )
end

def participant_115
  @participant_115 ||= Participant.new(
    pt_id: 115,
    locale: 'english'
  )
end

def participant_116
  @participant_116 ||= Participant.new(
    pt_id: 116,
    locale: 'english'
  )
end

def participant_143
  @participant_143 ||= Participant.new(
    pt_id: 143,
    locale: 'english'
  )
end

def participant_144
  @participant_144 ||= Participant.new(
    pt_id: 144,
    locale: 'english'
  )
end

def participant_145
  @participant_145 ||= Participant.new(
    pt_id: 145,
    locale: 'english'
  )
end

def participant_155
  @participant_155 ||= Participant.new(
    pt_id: 155,
    locale: 'english'
  )
end

def participant_213
  @participant_213 ||= Participant.new(
    pt_id: 213,
    locale: 'español'
  )
end

def participant_20
  @participant_20 ||= Participant.new(
    pt_id: 20,
    locale: 'español'
  )
end

def participant_21
  @participant_21 ||= Participant.new(
    pt_id: 21,
    locale: 'español'
  )
end

def participant_22
  @participant_21 ||= Participant.new(
    pt_id: 21,
    locale: 'español'
  )
end

def participant_214
  @participant_214 ||= Participant.new(
    pt_id: 214,
    locale: 'español'
  )
end

def participant_215
  @participant_215 ||= Participant.new(
    pt_id: 215,
    locale: 'español'
  )
end

def participant_216
  @participant_216 ||= Participant.new(
    pt_id: 216,
    locale: 'español'
  )
end

def participant_243
  @participant_243 ||= Participant.new(
    pt_id: 243,
    locale: 'español'
  )
end

def participant_244
  @participant_244 ||= Participant.new(
    pt_id: 244,
    locale: 'español'
  )
end

def participant_245
  @participant_245 ||= Participant.new(
    pt_id: 245,
    locale: 'español'
  )
end

def participant_255
  @participant_255 ||= Participant.new(
    pt_id: 255,
    locale: 'español'
  )
end
