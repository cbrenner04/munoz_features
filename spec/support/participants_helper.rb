# filename: ./spec/support/participants_helper.rb

require './lib/pages/participants'

def participant_113
  @participant_113 ||= Participants.new(
    pt_id: 113
  )
end

def participant_132
  @participant_132 ||= Participants.new(
    pt_id: 132
  )
end
