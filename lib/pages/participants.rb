# frozen_string_literal: true
# page object for Participants
class Participant
  include Capybara::DSL

  def initialize(participants_arry)
    @pt_id ||= participants_arry[:pt_id]
    @locale ||= participants_arry[:locale]
  end

  def go_to_sign_in
    go_to_root
    button = locale('Sign in', 'Iniciar sesión')
    click_on button
  end

  def click_on_sign_up
    link = locale('Sign up', 'Registrarse')
    click_on link
  end

  def sign_in
    go_to_root
    sign_out unless has_css?('a', text: locale('Sign in', 'Iniciar sesión'))
    click_sign_in
    fill_in_ptp_email
    fill_in_ptp_password
    click_sign_in
  end

  def fill_in_ptp_email
    fill_in 'participant_email', with: ENV["Pt_#{@pt_id}_Email"]
  end

  def fill_in_ptp_password
    fill_in 'participant_password', with: ENV["Pt_#{@pt_id}_Password"]
  end

  def phone_confirmation
    var = locale('en', 'es')
    ptp_confirm_env = ENV["Pt_#{@pt_id}_Confirmation"]
    "#{ENV['Base_URL']}/confirm_phone?locale=#{var}&" \
      "token=#{ptp_confirm_env}"
  end

  def email_confirmation
    var = locale('en', 'es')
    ptp_confirm_env = ENV["Pt_#{@pt_id}_Confirmation"]
    "#{ENV['Base_URL']}/#{var}/participants/confirmation?" \
      "confirmation_token=#{ptp_confirm_env}"
  end

  # update to add this in to items. This doesn't work

  def on_landing_page?
    link_text = locale('Stop Smoking Guide', 'Guía Para Dejar de Fumar')
    find('a', text: link_text)
  end

  # this will only work for Home, Stop Smoking Guide and Cigarette Counter
  def navigate_to(button)
    find('.navbar-toggle').click unless has_css?('.glyphicon.glyphicon-cog')
    find('.ng-binding', text: button).click
  end

  # this will work for set quit date, review consent, and sign out
  def go_to(button)
    find('.navbar-toggle').click unless has_css?('.glyphicon.glyphicon-cog')
    find('.dropdown-toggle').click
    find('.ng-binding', text: button).click
  end

  # This will only work for switching languages
  def switch_language
    language = locale('Español', 'English')
    go_to language
  end

  def trans_mo(date)
    date
      .gsub('Jan', 'Ene')
      .gsub('Apr', 'Abr')
      .gsub('Aug', 'Ago')
      .gsub('Dec', 'Dic')
  end

  def locale(english, spanish)
    @locale == 'english' ? english : spanish
  end

  def go_to_root
    visit ENV['Base_URL']
  end

  private

  def click_sign_in
    button = locale('Sign in', 'Iniciar sesión')
    click_on button
  end

  def sign_out
    find('.navbar-toggle').click
    find('.dropdown-toggle').click
    click_on locale('Sign out', 'Finalizar la sesión')
  rescue Capybara::ElementNotFound
    # sometimes the previous participant is not the same
    # language as the current participant
    click_on locale('Finalizar la sesión', 'Sign out')
  end
end
