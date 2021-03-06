# frozen_string_literal: true
require './lib/pages/participants/consent'
require './lib/pages/participants/eligibility'
require './lib/pages/participants/cigarette_counter'
require './lib/pages/participants/stop_smoking_guide'
require './lib/pages/participants/quit_date'

def consent_eng
  @consent_eng ||= Participants::Consent.new(locale: 'english')
end

def consent_esp
  @consent_esp ||= Participants::Consent.new(locale: 'español')
end

def ptp_108_consent
  @ptp_108_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_108_Email'],
    phone: ENV['Pt_108_Phone_Number'],
    password: ENV['Pt_108_Password']
  )
end

def ptp_208_consent
  @ptp_208_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_208_Email'],
    phone: ENV['Pt_208_Phone_Number'],
    password: ENV['Pt_208_Password']
  )
end

# Methods for Eligibility related items

def eligibility_eng
  @eligibility_eng ||= Participants::Eligibility.new(
    locale: 'english',
    current_smoker: 'Yes',
    thinking_of_quitting: 'Yes',
    age: 25
  )
end

def eligibility_esp
  @eligibility_esp ||= Participants::Eligibility.new(
    locale: 'español',
    current_smoker: 'Sí',
    thinking_of_quitting: 'Sí',
    age: 25
  )
end

def ptp_35_eligibility
  @ptp_35_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_35_Email'],
    phone: ENV['Pt_35_Phone_Number'],
    password: ENV['Pt_35_Password']
  )
end

def ptp_36_eligibility
  @ptp_36_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_36_Email'],
    phone: ENV['Pt_36_Phone_Number'],
    password: ENV['Pt_36_Password']
  )
end

def ptp_106_eligibility
  @ptp_106_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_106_Email'],
    phone: ENV['Pt_106_Phone_Number'],
    password: ENV['Pt_106_Password']
  )
end

def ptp_107_eligibility
  @ptp_107_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_107_Email'],
    phone: ENV['Pt_107_Phone_Number'],
    password: ENV['Pt_107_Password']
  )
end

def ptp_109_eligibility
  @ptp_109_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_109_Email'],
    phone: ENV['Pt_109_Phone_Number'],
    password: ENV['Pt_109_Password']
  )
end

def ptp_131_eligibility
  @ptp_131_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_131_Email'],
    phone: ENV['Pt_131_Phone_Number'],
    password: ENV['Pt_131_Password']
  )
end

# Spanish

def ptp_37_eligibility
  @ptp_37_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_37_Email'],
    phone: ENV['Pt_37_Phone_Number'],
    password: ENV['Pt_37_Password']
  )
end

def ptp_38_eligibility
  @ptp_38_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_38_Email'],
    phone: ENV['Pt_38_Phone_Number'],
    password: ENV['Pt_38_Password']
  )
end

def ptp_39_eligibility
  @ptp_39_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_39_Email'],
    phone: ENV['Pt_39_Phone_Number'],
    password: ENV['Pt_39_Password']
  )
end

def ptp_40_eligibility
  @ptp_40_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_40_Email'],
    phone: ENV['Pt_40_Phone_Number'],
    password: ENV['Pt_40_Password']
  )
end

def ptp_206_eligibility
  @ptp_206_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_206_Email'],
    phone: ENV['Pt_206_Phone_Number'],
    password: ENV['Pt_206_Password']
  )
end

def ptp_207_eligibility
  @ptp_207_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_207_Email'],
    phone: ENV['Pt_207_Phone_Number'],
    password: ENV['Pt_207_Password']
  )
end

def ptp_209_eligibility
  @ptp_209_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_209_Email'],
    phone: ENV['Pt_209_Phone_Number'],
    password: ENV['Pt_209_Password']
  )
end

def ptp_231_eligibility
  @ptp_231_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_231_Email'],
    phone: ENV['Pt_231_Phone_Number'],
    password: ENV['Pt_231_Password']
  )
end

# Methods for Stop Smoking Guide related items

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

# Methods for Cigarette Counter related items

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

# Methods for Quit Date related items

def quit_date_eng
  @quit_date_eng ||= Participants::QuitDate.new(locale: 'english')
end

def quit_date_esp
  @quit_date_esp ||= Participants::QuitDate.new(locale: 'español')
end

# Participants POM methods

def participant_35
  @participant_35 ||= Participant.new(
    pt_id: 35,
    locale: 'english'
  )
end

def participant_36
  @participant_36 ||= Participant.new(
    pt_id: 36,
    locale: 'english'
  )
end

def participant_37
  @participant_37 ||= Participant.new(
    pt_id: 37,
    locale: 'english'
  )
end

def participant_106
  @participant_106 ||= Participant.new(
    pt_id: 106,
    locale: 'english'
  )
end

def participant_107
  @participant_107 ||= Participant.new(
    pt_id: 107,
    locale: 'english'
  )
end

def participant_108
  @participant_108 ||= Participant.new(
    pt_id: 108,
    locale: 'english'
  )
end

def participant_109
  @participant_109 ||= Participant.new(
    pt_id: 109,
    locale: 'english'
  )
end

def participant_131
  @participant_131 ||= Participant.new(
    pt_id: 131,
    locale: 'english'
  )
end

def participant_38
  @participant_38 ||= Participant.new(
    pt_id: 38,
    locale: 'español'
  )
end

def participant_39
  @participant_39 ||= Participant.new(
    pt_id: 39,
    locale: 'español'
  )
end

def participant_40
  @participant_40 ||= Participant.new(
    pt_id: 40,
    locale: 'español'
  )
end

def participant_206
  @participant_206 ||= Participant.new(
    pt_id: 206,
    locale: 'español'
  )
end

def participant_207
  @participant_207 ||= Participant.new(
    pt_id: 207,
    locale: 'español'
  )
end

def participant_208
  @participant_208 ||= Participant.new(
    pt_id: 208,
    locale: 'español'
  )
end

def participant_209
  @participant_209 ||= Participant.new(
    pt_id: 209,
    locale: 'español'
  )
end

def participant_231
  @participant_231 ||= Participant.new(
    pt_id: 231,
    locale: 'español'
  )
end
