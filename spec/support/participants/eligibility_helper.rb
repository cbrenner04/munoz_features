# frozen_string_literal: true
require './lib/pages/participants/eligibility'
require './lib/pages/participants/consent'
require './lib/pages/participants/cigarette_counter'
require './lib/pages/participants/stop_smoking_guide'

def participant_9
  @participant_9 ||= Participant.new(
    pt_id: 9,
    locale: 'english'
  )
end

def participant_31
  @participant_31 ||= Participant.new(
    pt_id: 31,
    locale: 'english'
  )
end

def participant_32
  @participant_32 ||= Participant.new(
    pt_id: 32,
    locale: 'english'
  )
end

def participant_100
  @participant_100 ||= Participant.new(
    pt_id: 100,
    locale: 'english'
  )
end

def participant_101
  @participant_101 ||= Participant.new(
    pt_id: 101,
    locale: 'english'
  )
end

def participant_102
  @participant_102 ||= Participant.new(
    pt_id: 102,
    locale: 'english'
  )
end

def participant_103
  @participant_103 ||= Participant.new(
    pt_id: 103,
    locale: 'english'
  )
end

def participant_104
  @participant_104 ||= Participant.new(
    pt_id: 104,
    locale: 'english'
  )
end

def participant_152
  @participant_152 ||= Participant.new(
    pt_id: 152,
    locale: 'english'
  )
end

def participant_301
  @participant_301 ||= Participant.new(
    pt_id: 301,
    locale: 'english'
  )
end

def participant_302
  @participant_302 ||= Participant.new(
    pt_id: 302,
    locale: 'english'
  )
end

def participant_10
  @participant_10 ||= Participant.new(
    pt_id: 10,
    locale: 'español'
  )
end

def participant_26
  @participant_26 ||= Participant.new(
    pt_id: 26,
    locale: 'español'
  )
end

def participant_33
  @participant_33 ||= Participant.new(
    pt_id: 33,
    locale: 'español'
  )
end

def participant_34
  @participant_34 ||= Participant.new(
    pt_id: 34,
    locale: 'español'
  )
end

def participant_200
  @participant_200 ||= Participant.new(
    pt_id: 200,
    locale: 'español'
  )
end

def participant_201
  @participant_201 ||= Participant.new(
    pt_id: 201,
    locale: 'español'
  )
end

def participant_202
  @participant_202 ||= Participant.new(
    pt_id: 202,
    locale: 'español'
  )
end

def participant_203
  @participant_203 ||= Participant.new(
    pt_id: 203,
    locale: 'español'
  )
end

def participant_204
  @participant_204 ||= Participant.new(
    pt_id: 204,
    locale: 'español'
  )
end

def participant_252
  @participant_252 ||= Participant.new(
    pt_id: 252,
    locale: 'español'
  )
end

def participant_401
  @participant_401 ||= Participant.new(
    pt_id: 401,
    locale: 'español'
  )
end

def participant_402
  @participant_402 ||= Participant.new(
    pt_id: 402,
    locale: 'español'
  )
end

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

def chicago_eligibility
  @chicago_eligibility ||= Participants::Eligibility.new(
    zip: ZipCodes::CHI.sample
  )
end

def age_eligibility
  @age_eligibility ||= Participants::Eligibility.new(age: 'h')
end

def short_zip_eligibility
  @short_zip_eligibility ||= Participants::Eligibility.new(zip: 33)
end

def long_zip_eligibility
  @long_zip_eligibility ||= Participants::Eligibility.new(
    zip: 333_333_333
  )
end

def bad_email_eligibility
  @bad_email_eligibility ||= Participants::Eligibility.new(email: 2)
end

def bad_phone_eligibility
  @bad_phone_eligibility ||= Participants::Eligibility.new(phone: 33)
end

def bad_password_eligibility
  @bad_password_eligibility ||= Participants::Eligibility.new(
    password: 'asdf'
  )
end

def ptp_101_eligibility
  @ptp_101_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_101_Email'],
    phone: ENV['Pt_101_Phone_Number'],
    password: ENV['Pt_101_Password']
  )
end

def ptp_102_eligibility
  @ptp_102_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_102_Email'],
    phone: ENV['Pt_102_Phone_Number'],
    password: ENV['Pt_102_Password']
  )
end

def ptp_102_elg_age_17
  @ptp_102_elg_age_17 ||= Participants::Eligibility.new(age: '17')
end

def ptp_103_eligibility
  @ptp_103_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_103_Email'],
    phone: ENV['Pt_103_Phone_Number'],
    password: ENV['Pt_103_Password'],
    current_smoker: 'No'
  )
end

def ptp_104_eligibility
  @ptp_104_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_104_Email'],
    phone: ENV['Pt_104_Phone_Number'],
    password: ENV['Pt_104_Password'],
    thinking_of_quitting: 'No'
  )
end

def ptp_9_eligibility
  @ptp_9_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_9_Email'],
    phone: ENV['Pt_9_Phone_Number'],
    password: ENV['Pt_9_Password']
  )
end

def ptp_9_elg_age_0
  @ptp_9_elg_age_0 ||= Participants::Eligibility.new(age: '0')
end

def ptp_9_elg_age_121
  @ptp_9_elg_age_121 ||= Participants::Eligibility.new(age: '121')
end

def ptp_31_eligibility
  @ptp_31_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_31_Email'],
    phone: ENV['Pt_31_Phone_Number'],
    password: ENV['Pt_31_Password']
  )
end

def ptp_25_eligibility
  @ptp_25_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_25_Email'],
    phone: ENV['Pt_25_Phone_Number'],
    password: ENV['Pt_25_Password']
  )
end

def ptp_151_eligibility
  @ptp_151_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_151_Email'],
    phone: ENV['Pt_151_Phone_Number'],
    password: ENV['Pt_151_Password']
  )
end

def ptp_152_eligibility
  @ptp_152_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_152_Email'],
    phone: ENV['Pt_152_Phone_Number'],
    password: ENV['Pt_152_Password']
  )
end

def ptp_32_eligibility
  @ptp_32_eligibility ||= Participants::Eligibility.new(
    locale: 'english',
    email: ENV['Pt_32_Email'],
    phone: ENV['Pt_32_Phone_Number'],
    password: ENV['Pt_32_Password']
  )
end

# Spanish

def ptp_201_eligibility
  @ptp_201_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_201_Email'],
    phone: ENV['Pt_201_Phone_Number'],
    password: ENV['Pt_201_Password']
  )
end

def ptp_202_eligibility
  @ptp_202_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_202_Email'],
    phone: ENV['Pt_202_Phone_Number'],
    password: ENV['Pt_202_Password']
  )
end

def ptp_202_elg_age_17
  @ptp_202_elg_age_17 ||= Participants::Eligibility.new(age: '17')
end

def ptp_203_eligibility
  @ptp_203_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_203_Email'],
    phone: ENV['Pt_203_Phone_Number'],
    password: ENV['Pt_203_Password'],
    current_smoker: 'No'
  )
end

def ptp_204_eligibility
  @ptp_204_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_204_Email'],
    phone: ENV['Pt_204_Phone_Number'],
    password: ENV['Pt_204_Password'],
    thinking_of_quitting: 'No'
  )
end

def ptp_10_eligibility
  @ptp_10_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_10_Email'],
    phone: ENV['Pt_10_Phone_Number'],
    password: ENV['Pt_10_Password']
  )
end

def ptp_10_elg_age_0
  @ptp_10_elg_age_0 ||= Participants::Eligibility.new(age: '0')
end

def ptp_10_elg_age_121
  @ptp_10_elg_age_121 ||= Participants::Eligibility.new(age: '121')
end

def ptp_33_eligibility
  @ptp_33_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_33_Email'],
    phone: ENV['Pt_33_Phone_Number'],
    password: ENV['Pt_33_Password']
  )
end

def ptp_26_eligibility
  @ptp_26_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_26_Email'],
    phone: ENV['Pt_26_Phone_Number'],
    password: ENV['Pt_26_Password']
  )
end

def ptp_251_eligibility
  @ptp_251_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_251_Email'],
    phone: ENV['Pt_251_Phone_Number'],
    password: ENV['Pt_251_Password']
  )
end

def ptp_252_eligibility
  @ptp_252_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_252_Email'],
    phone: ENV['Pt_252_Phone_Number'],
    password: ENV['Pt_252_Password']
  )
end

def ptp_34_eligibility
  @ptp_34_eligibility ||= Participants::Eligibility.new(
    locale: 'español',
    email: ENV['Pt_34_Email'],
    phone: ENV['Pt_34_Phone_Number'],
    password: ENV['Pt_34_Password']
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

# Methods for Stop Smoking Guide related items

def consent_eng
  @consent_eng ||= Participants::Consent.new(locale: 'english')
end

def consent_esp
  @consent_esp ||= Participants::Consent.new(locale: 'español')
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

def participant_gen_eng
  @participant_gen_eng ||= Participant.new(locale: 'english')
end

def participant_gen_esp
  @participant_gen_esp ||= Participant.new(locale: 'español')
end

def participant_251
  @participant_251 ||= Participant.new(
    pt_id: 251,
    locale: 'español'
  )
end
