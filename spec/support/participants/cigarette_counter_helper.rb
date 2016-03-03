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
    date: Date.today,
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
    date: Date.today - 1,
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
    day: 'Today',
    locale: 'español'
  )
end

def pt_245_cig_counter
  @pt_245_cig_counter ||= Participants::CigaretteCounter.new(
    count: 5,
    date: Date.today,
    day: 'Today',
    locale: 'español'
  )
end

def pt_255_cig_counter
  @pt_255_cig_counter ||= Participants::CigaretteCounter.new(
    date: Date.today,
    day: 'Today',
    locale: 'español'
  )
end
