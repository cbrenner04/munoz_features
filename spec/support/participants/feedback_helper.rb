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
