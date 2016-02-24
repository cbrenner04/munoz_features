# page object for Participants
class Participants
  include Capybara::DSL

  def initialize(participants_arry)
    @pt_id ||= participants_arry[:pt_id]
  end

  def sign_in_pt_en
    visit ENV['Base_URL']
    unless has_css?('a', text: 'Sign in')
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      if has_text?('Sign out')
        click_on 'Sign out'
      else
        click_on 'Finalizar la sesión'
      end
    end
    click_on 'Sign in'
    fill_in 'participant_email', with: ENV["Pt_#{@pt_id}_Email"]
    fill_in 'participant_password', with: ENV["Pt_#{@pt_id}_Password"]
    click_on 'Sign in'
    find('a', text: 'Stop Smoking Guide')
  end

  def sign_in_pt_es
    visit ENV['Base_URL']
    unless has_css?('a', text: 'Iniciar sesión')
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      if page.has_text?('Finalizar la sesión')
        click_on 'Finalizar la sesión'
      else
        click_on 'Sign out'
      end
    end
    click_on 'Iniciar sesión'
    fill_in 'participant_email', with: ENV["Pt_#{@id}_Email"]
    fill_in 'participant_password', with: ENV["Pt_#{@id}_Password"]
    click_on 'Iniciar sesión'
    find('a', text: 'Guía Para Dejar de Fumar')
  end

  # this will only work for Home, Stop Smoking Guide and Cigarette Counter
  def navigate_to(button)
    unless page.has_css?('.glyphicon.glyphicon-cog')
      find('.navbar-toggle').click
    end
    find('.ng-binding', text: button).click
  end

  # this will work for switching languages, set quit date, review consent,
  # and sign out
  def go_to(button)
    unless page.has_css?('.glyphicon.glyphicon-cog')
      find('.navbar-toggle').click
    end
    find('.dropdown-toggle').click
    find('.ng-binding', text: button).click
  end

  def trans_mo(date)
    date
      .gsub('Jan', 'Ene')
      .gsub('Apr', 'Abr')
      .gsub('Aug', 'Ago')
      .gsub('Dec', 'Dic')
  end
end