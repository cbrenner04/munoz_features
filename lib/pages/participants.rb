# page object for Participants
class Participants
  include Capybara::DSL

  def initialize(participants_arry)
    @pt_id ||= participants_arry[:pt_id]
    @locale ||= participants_arry[:locale]
  end

  def sign_in
    go_to_root
    @locale == 'english' ? button = 'Sign in' : button = 'Iniciar sesión'
    unless has_css?('a', text: button)
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      if has_text?('Sign out')
        click_on 'Sign out'
      else
        click_on 'Finalizar la sesión'
      end
    end
    click_on button
    fill_in 'participant_email', with: ENV["Pt_#{@pt_id}_Email"]
    fill_in 'participant_password', with: ENV["Pt_#{@pt_id}_Password"]
    click_on button
  end

  # update to add this in to items.

  def on_landing_page?
    if @locale == 'english'
      find('a', text: 'Stop Smoking Guide')
    else
      find('a', text: 'Guía Para Dejar de Fumar')
    end
  end

  # this will only work for Home, Stop Smoking Guide and Cigarette Counter
  def navigate_to(button)
    unless page.has_css?('.glyphicon.glyphicon-cog')
      find('.navbar-toggle').click
    end
    find('.ng-binding', text: button).click
  end

  # this will work for set quit date, review consent,
  # and sign out
  def go_to(button)
    unless page.has_css?('.glyphicon.glyphicon-cog')
      find('.navbar-toggle').click
    end
    find('.dropdown-toggle').click
    find('.ng-binding', text: button).click
  end

  # This will only work for switching languages
  def switch_language
    language = @locale == 'english' ? 'Español' : 'English'
    go_to language
  end

  def trans_mo(date)
    date
      .gsub('Jan', 'Ene')
      .gsub('Apr', 'Abr')
      .gsub('Aug', 'Ago')
      .gsub('Dec', 'Dic')
  end

  def locale(a, b)
    @locale == 'english' ? a : b
  end

  def go_to_root
    visit ENV['Base_URL']
  end
end
