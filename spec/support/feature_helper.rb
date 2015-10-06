# filename: spec/support/feature_helper.rb

def sign_in_pt_en(email, password)
  visit ENV['Base_URL']
  if page.has_css?('a', text: 'Sign in')
    click_on 'Sign in'
    fill_in 'participant_email', with: email
    fill_in 'participant_password', with: password
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  else
    puts 'LOGIN FAILED'
  end
end

def sign_in_pt_es(email, password)
  visit ENV['Base_URL']
  if page.has_css?('a', text: 'Iniciar sésion')
    click_on 'Iniciar sésion'
    fill_in 'participant_email', with: email
    fill_in 'participant_password', with: password
    click_on 'Iniciar sésion'
    expect(page).to have_content 'Sesión iniciada.'
  else
    puts 'LOGIN FAILED'
  end
end
