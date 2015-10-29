# filename: spec/support/feature_helper.rb

def sign_in_pt_en(id)
  visit ENV['Base_URL']
  unless page.has_css?('a', text: 'Sign in')
    find('.navbar-toggle').click
    if page.has_text?('Sign out')
      click_on 'Sign out'
    else
      click_on 'Finalizar la sesión'
    end
  end
  click_on 'Sign in'
  fill_in 'participant_email', with: ENV["Pt_#{id}_Email"]
  fill_in 'participant_password', with: ENV["Pt_#{id}_Password"]
  click_on 'Sign in'
  find('a', text: 'Set Your Quit Date')
  within('.alert.alert-info.alert-dismissable') do
    find('button[type = button]').click
  end
end

def sign_in_pt_es(id)
  visit ENV['Base_URL']
  unless page.has_css?('a', text: 'Iniciar sesión')
    find('.navbar-toggle').click
    if page.has_text?('Finalizar la sesión')
      click_on 'Finalizar la sesión'
    else
      click_on 'Sign out'
    end
  end
  click_on 'Iniciar sesión'
  fill_in 'participant_email', with: ENV["Pt_#{id}_Email"]
  fill_in 'participant_password', with: ENV["Pt_#{id}_Password"]
  click_on 'Iniciar sesión'
  find('a', text: 'Set Your Quit Date (ES)') # need to update with Spanish
  within('.alert.alert-info.alert-dismissable') do
    find('button[type = button]').click
  end
end

def navigate_to(button)
  find('.navbar-toggle').click
  find('.ng-binding', text: button).click
end
