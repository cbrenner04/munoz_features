require './lib/pages/participants/consent.rb'

def consent_eng
  @consent_eng ||= Participants::Consent.new(locale: 'english')
end

def consent_esp
  @consent_esp ||= Participants::Consent.new(locale: 'español')
end

def ptp_35_consent
  @ptp_35_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_35_Email'], 
    phone: ENV['Pt_35_Phone_Number'],
    password: ENV['Pt_35_Password']
  )
end

def ptp_36_consent
  @ptp_36_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_36_Email'], 
    phone: ENV['Pt_36_Phone_Number'],
    password: ENV['Pt_36_Password']
  )
end

def ptp_106_consent
  @ptp_106_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_106_Email'], 
    phone: ENV['Pt_106_Phone_Number'],
    password: ENV['Pt_106_Password']
  )
end

def ptp_107_consent
  @ptp_107_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_107_Email'], 
    phone: ENV['Pt_107_Phone_Number'],
    password: ENV['Pt_107_Password']
  )
end

def ptp_108_consent
  @ptp_108_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_108_Email'], 
    phone: ENV['Pt_108_Phone_Number'],
    password: ENV['Pt_108_Password']
  )
end

def ptp_109_consent
  @ptp_109_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_109_Email'], 
    phone: ENV['Pt_109_Phone_Number'],
    password: ENV['Pt_109_Password']
  )
end

def ptp_131_consent
  @ptp_131_consent ||= Participants::Consent.new(
    locale: 'english',
    email: ENV['Pt_131_Email'], 
    phone: ENV['Pt_131_Phone_Number'],
    password: ENV['Pt_131_Password']
  )
end

# Spanish

def ptp_38_consent
  @ptp_38_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_38_Email'], 
    phone: ENV['Pt_38_Phone_Number'],
    password: ENV['Pt_38_Password']
  )
end

def ptp_39_consent
  @ptp_39_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_39_Email'], 
    phone: ENV['Pt_39_Phone_Number'],
    password: ENV['Pt_39_Password']
  )
end

def ptp_40_consent
  @ptp_40_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_40_Email'], 
    phone: ENV['Pt_40_Phone_Number'],
    password: ENV['Pt_40_Password']
  )
end

def ptp_206_consent
  @ptp_206_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_206_Email'], 
    phone: ENV['Pt_206_Phone_Number'],
    password: ENV['Pt_206_Password']
  )
end

def ptp_207_consent
  @ptp_207_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_207_Email'], 
    phone: ENV['Pt_207_Phone_Number'],
    password: ENV['Pt_207_Password']
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

def ptp_209_consent
  @ptp_209_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_209_Email'], 
    phone: ENV['Pt_209_Phone_Number'],
    password: ENV['Pt_209_Password']
  )
end

def ptp_231_consent
  @ptp_231_consent ||= Participants::Consent.new(
    locale: 'español',
    email: ENV['Pt_231_Email'], 
    phone: ENV['Pt_231_Phone_Number'],
    password: ENV['Pt_231_Password']
  )
end
