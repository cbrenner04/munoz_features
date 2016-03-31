require './lib/pages/participants/eligibility.rb'

def eligibility_eng
  @eligibility_eng ||= Participants::Eligibility.new(locale: 'english')
end

def eligibility_esp
  @eligibility_esp ||= Participants::Eligibility.new(locale: 'español')
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
