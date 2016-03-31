require './lib/pages/participants/consent.rb'

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
