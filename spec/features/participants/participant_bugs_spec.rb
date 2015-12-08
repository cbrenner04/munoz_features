# filename: spec/features/participants/participant_bugs_spec.rb

describe 'A registered and consented participant signs in',
         type: :feature, metadata: :participant do
  context 'in English' do
    it 'switches language at the end of a stop smoking guide, navigates to ' \
       'the next guide, sees the correct text' do
      sign_in_pt_en('121')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How Can I Quit?'
      find('h4', text: 'How to quit page 1 title')
      find('a', text: 'Next').click
      find('h4', text: 'How to quit page 2 title')
      find('a', text: 'Next').click
      find('h4', text: 'How to quit page 3 title')
      go_to('Español')
      find('h4', text: 'Cómo dejar de fumar página 3 título')
      find('.ng-binding', text: 'Cómo dejar de fumar página 3 cuerpo')
      find('a', text: 'Sig.').click
      expect(page).to have_css('h3', text: '¿Y si empiezo a fumar de nuevo?')
      expect(page).to have_css('h4', text: '¿Y sí? página 1 título')
      expect(page).to have_content '¿Y sí? página 1 cuerpo'
    end
  end

  context 'in Español' do
    it 'switches language at the end of a stop smoking guide, navigates to ' \
       'the next guide, sees the correct text' do
      sign_in_pt_es('225')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on '¿Por qué debo dejar de fumar?'
      find('h4', text: '¿Por qué dejar de fumar? página 1 título')
      find('a', text: 'Sig.').click
      find('h4', text: '¿Por qué dejar de fumar? página 2 título')
      find('a', text: 'Sig.').click
      find('h4', text: '¿Por qué dejar de fumar? página 3 título')
      go_to('English')
      find('h4', text: 'Why Quit? page 3 title')
      find('.ng-binding', text: 'Why Quit? page 3 body')
      find('a', text: 'Next').click
      expect(page).to have_css('h3', text: 'How Can I Quit')
      expect(page).to have_css('h4', text: 'How to quit page 1 title')
      expect(page).to have_content 'How to quit page 1 body'
    end
  end
end
