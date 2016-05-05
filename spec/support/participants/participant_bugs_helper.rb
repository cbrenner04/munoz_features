require './lib/pages/participants/stop_smoking_guide'

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

# Participants POM methods

def participant_121
  @participant_121 ||= Participants.new(
    pt_id: 121,
    locale: 'english'
  )
end

def participant_225
  @participant_225 ||= Participants.new(
    pt_id: 225,
    locale: 'español'
  )
end
