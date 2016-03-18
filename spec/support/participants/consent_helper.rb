require './lib/pages/participants/consent.rb'

def consent
  @consent ||= Participants::Consent.new(locale: 'english')
end
