class Participants
  # page object for Consent
  class Consent
    include Capybara::DSL

  def eligibility_page
    @locale == 'english' ? var = 'en' : var = 'es'
    "#{ENV['Base_URL']}/#/#{var}/pages/application#/#/#{var}/eligibility"
  end

  def visible_in_eng?
    has_text? 'PALO ALTO UNIVERSITY CONSENT'
  end

  def visible_in_esp?
    has_text? 'UNIVERSIDAD DE PALO ALTO CONSENTIMIENTO'
  end

  end
end