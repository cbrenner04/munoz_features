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
  expect(page).to have_content 'Signed in successfully.'
end

def sign_in_pt_es(id)
  visit ENV['Base_URL']
  unless page.has_css?('a', text: 'Iniciar sésion')
    find('.navbar-toggle').click
    if page.has_text?('Finalizar la sesión')
      click_on 'Finalizar la sesión'
    else
      click_on 'Sign out'
    end
  end
  click_on 'Iniciar sésion'
  fill_in 'participant_email', with: ENV["Pt_#{id}_Email"]
  fill_in 'participant_password', with: ENV["Pt_#{id}_Password"]
  click_on 'Iniciar sésion'
  expect(page).to have_content 'Sesión iniciada.'
end

def switch_lang(language)
  find('.navbar-toggle').click
  find('.navbar-link.ng-binding', text: language).click
end
