# filename: spec/features/participants/stop_smoking_guide_spec.rb

describe 'A registered and consented participant signs in', type: :feature do
  context 'in English' do
    it 'navigates to the Stop Smoking Guide menu' do
      sign_in_pt_en('117')
      click_on 'Stop Smoking Guide'
      expect(page).to have_css('a', text: 'Why Should I Quit?')
    end

    it 'switches to Español in Stop Smoking Guide menu' do
      sign_in_pt_en('126')
      click_on 'Stop Smoking Guide'
      find('a', text: 'Why Should I Quit?')
      switch_lang('Español')
      expect(page).to have_css('a', text: 'Why Should I Quit?') # need to update with Spanish
    end

    it 'navigates to How to Help guide' do
      sign_in_pt_en('118')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How do I Help Someone Quit?'
      expect(page).to have_css('h2', text: 'How to help page 1 title')
      expect(page).to have_content 'How to help page 1 body'
    end

    it 'completes How to Help guide' do
      sign_in_pt_en('119')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How do I Help Someone Quit?'
      find('h2', text: 'How to help page 1 title')
      find('a', text: 'Next').click
      find('h2', text: 'How to help page 2 title')
      find('a', text: 'Next').click
      find('h2', text: 'How to help page 3 title')
      find('a', text: 'Next').click
      expect(page).to have_content 'Stop Smoking Guide'
    end

    it 'switches to Español in How to Help guide' do
      sign_in_pt_en('127')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How do I Help Someone Quit?'
      find('h2', text: 'How to help page 1 title')
      switch_lang('Español')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('h2', text: 'Como ayudar página 1 título')
      expect(page).to have_content 'Como ayudar página 1 cuerpo'
    end

    it 'navigates to How to Quit guide' do
      sign_in_pt_en('120')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How Can I Quit?'
      expect(page).to have_css('h2', text: 'How to quit page 1 title')
      expect(page).to have_content 'How to quit page 1 body'
    end

    it 'completes How to Quit guide' do
      sign_in_pt_en('121')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How Can I Quit?'
      find('h2', text: 'How to quit page 1 title')
      find('a', text: 'Next').click
      find('h2', text: 'How to quit page 2 title')
      find('a', text: 'Next').click
      find('h2', text: 'How to quit page 3 title')
      find('a', text: 'Next').click
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_content 'What if? page 1 title'
    end

    it 'switches to Español in How to Quit guide' do
      sign_in_pt_en('128')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How Can I Quit?'
      find('h2', text: 'How to quit page 1 title')
      switch_lang('Español')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page)
        .to have_css('h2', text: 'Cómo dejar de fumar página 1 título')
      expect(page).to have_content 'Cómo dejar de fumar página 1 cuerpo'
    end

    it 'navigates to What If guide' do
      sign_in_pt_en('122')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?'
      expect(page).to have_css('h2', text: 'What if? page 1 title')
      expect(page).to have_content 'What if? page 1 body'
    end

    it 'completes What if guide' do
      sign_in_pt_en('123')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?'
      find('h2', text: 'What if? page 1 title')
      find('a', text: 'Next').click
      find('h2', text: 'What if? page 2 title')
      find('a', text: 'Next').click
      find('h2', text: 'What if? page 3 title')
      find('a', text: 'Next').click
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_content 'How to help page 1 title'
    end

    it 'switches to Español in What if guide' do
      sign_in_pt_en('129')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?'
      find('h2', text: 'What if? page 1 title')
      switch_lang('Español')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('h2', text: '¿Y sí? página 1 título')
      expect(page).to have_content '¿Y sí? página 1 cuerpo'
    end

    it 'navigates to Why Quit guide' do
      sign_in_pt_en('124')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'Why Should I Quit?'
      expect(page).to have_css('h2', text: 'Why Quit? page 1 title')
      expect(page).to have_content 'Why Quit? page 1 body'
    end

    it 'completes Why Quit guide' do
      sign_in_pt_en('125')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'Why Should I Quit?'
      find('h2', text: 'Why Quit? page 1 title')
      find('a', text: 'Next').click
      find('h2', text: 'Why Quit? page 2 title')
      find('a', text: 'Next').click
      find('h2', text: 'Why Quit? page 3 title')
      find('a', text: 'Next').click
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_content 'How to quit page 1 title'
    end

    it 'switches to Español in Why Quit guide' do
      sign_in_pt_en('130')
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'Why Should I Quit?'
      find('h2', text: 'Why Quit? page 1 title')
      switch_lang('Español')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page)
        .to have_css('h2', text: '¿Por qué dejar de fumar? página 1 título')
      expect(page).to have_content '¿Por qué dejar de fumar? página 1 cuerpo'
    end
  end

  context 'in Español' do
    it 'navigates to the Stop Smoking Guide menu' do
      sign_in_pt_es('217')
      click_on 'Stop Smoking Guide (ES)' # need to update with Spanish
      expect(page).to have_css('a', text: 'Why Should I Quit?') # need to update with Spanish
    end

    it 'switches to English in Stop Smoking Guide menu' do
      sign_in_pt_es('226')
      click_on 'Stop Smoking Guide (ES)' # need to update with Spanish
      find('a', text: 'Why Should I Quit?') # need to update with Spanish
      switch_lang('English')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('a', text: 'Why Should I Quit?')
    end

    it 'navigates to How to Help guide' do
      sign_in_pt_es('218')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'How do I Help Someone Quit?' # need to update with Spanish
      expect(page).to have_css('h2', text: 'Como ayudar página 1 título')
      expect(page).to have_content 'Como ayudar página 1 cuerpo'
    end

    it 'completes How to Help guide' do
      sign_in_pt_es('219')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'How do I Help Someone Quit?' # need to update with Spanish
      find('h2', text: 'Como ayudar página 1 título')
      find('a', text: 'Next').click
      find('h2', text: 'Como ayudar página 2 título')
      find('a', text: 'Next').click
      find('h2', text: 'Como ayudar página 3 título')
      find('a', text: 'Next').click
      expect(page).to have_content 'Stop Smoking Guide' # need to update with Spanish
    end

    it 'switches to English in How to Help guide' do
      sign_in_pt_es('227')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'How do I Help Someone Quit'  # need to update with Spanish
      find('h2', text: 'Como ayudar página 1 título')
      switch_lang('English')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('h2', text: 'How to help page 1 title')
      expect(page).to have_content 'How to help page 1 body'
    end

    it 'navigates to How to Quit guide' do
      sign_in_pt_es('220')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'How Can I Quit?' # need to update with Spanish
      expect(page)
        .to have_css('h2', text: 'Cómo dejar de fumar página 1 título')
      expect(page).to have_content 'Cómo dejar de fumar página 1 cuerpo'
    end

    it 'completes How to Quit guide' do
      sign_in_pt_es('221')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'How Can I Quit?' # need to update with Spanish
      find('h2', text: 'Cómo dejar de fumar página 1 título')
      find('a', text: 'Next').click
      find('h2', text: 'Cómo dejar de fumar página 2 título')
      find('a', text: 'Next').click
      find('h2', text: 'Cómo dejar de fumar página 3 título')
      find('a', text: 'Next').click
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_content '¿Y sí? página 1 título'
    end

    it 'switches to English in How to Quit guide' do
      sign_in_pt_es('228')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'How Can I Quit?' # need to update with Spanish
      find('h2', text: 'Cómo dejar de fumar página 1 título')
      switch_lang('English')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('h2', text: 'How to quit page 1 title')
      expect(page).to have_content 'How to quit page 1 body'
    end

    it 'navigates to What If guide' do
      sign_in_pt_es('222')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?' # need to update with Spanish
      expect(page).to have_css('h2', text: '¿Y sí? página 1 título')
      expect(page).to have_content '¿Y sí? página 1 cuerpo'
    end

    it 'completes What if guide' do
      sign_in_pt_es('223')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?' # need to update with Spanish
      find('h2', text: '¿Y sí? página 1 título')
      find('a', text: 'Next').click
      find('h2', text: '¿Y sí? página 2 título')
      find('a', text: 'Next').click
      find('h2', text: '¿Y sí? página 3 título')
      find('a', text: 'Next').click
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_content 'Como ayudar página 1 título'
    end

    it 'switches to English in the What if guide' do
      sign_in_pt_es('229')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?' # need to update with Spanish
      find('h2', text: '¿Y sí? página 1 título')
      switch_lang('English')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('h2', text: 'What if? page 1 title')
      expect(page).to have_content 'What if? page 1 body'
    end

    it 'navigates to Why Quit guide' do
      sign_in_pt_es('224')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'Why Should I Quit?' # need to update with Spanish
      expect(page)
        .to have_css('h2', text: '¿Por qué dejar de fumar? página 1 título')
      expect(page).to have_content '¿Por qué dejar de fumar? página 1 cuerpo'
    end

    it 'completes Why Quit guide' do
      sign_in_pt_es('225')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'Why Should I Quit?' # need to update with Spanish
      find('h2', text: '¿Por qué dejar de fumar? página 1 título')
      find('a', text: 'Next').click
      find('h2', text: '¿Por qué dejar de fumar? página 2 título')
      find('a', text: 'Next').click
      find('h2', text: '¿Por qué dejar de fumar? página 3 título')
      find('a', text: 'Next').click
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_content 'Cómo dejar de fumar página 1 título'
    end

    it 'switches to English in the Why Quit guide' do
      sign_in_pt_es('230')
      visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      click_on 'Why Should I Quit?' # need to update with Spanish
      find('h2', text: '¿Por qué dejar de fumar? página 1 título')
      switch_lang('English')
      page.evaluate_script('window.location.reload()') # remove when navigation fixed
      expect(page).to have_css('h2', text: 'Why Quit? page 1 title')
      expect(page).to have_content 'Why Quit? page 1 body'
    end
  end
end
