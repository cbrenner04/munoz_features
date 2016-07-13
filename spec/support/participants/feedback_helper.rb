# frozen_string_literal: true
require './lib/pages/participants/feedback'
require './lib/pages/participants/stop_smoking_guide'

def feedback_eng
  @feedback_eng ||= Participants::Feedback.new(locale: 'english')
end

def feedback_esp
  @feedback_esp ||= Participants::Feedback.new(locale: 'español')
end

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

def participant_146
  @participant_146 ||= Participant.new(
    pt_id: 146,
    locale: 'english'
  )
end

def participant_147
  @participant_147 ||= Participant.new(
    pt_id: 147,
    locale: 'english'
  )
end

def participant_148
  @participant_148 ||= Participant.new(
    pt_id: 148,
    locale: 'english'
  )
end

def participant_246
  @participant_246 ||= Participant.new(
    pt_id: 246,
    locale: 'español'
  )
end

def participant_247
  @participant_247 ||= Participant.new(
    pt_id: 247,
    locale: 'español'
  )
end

def participant_248
  @participant_248 ||= Participant.new(
    pt_id: 248,
    locale: 'español'
  )
end
