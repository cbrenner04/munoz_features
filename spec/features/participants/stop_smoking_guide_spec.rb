# filename: spec/features/participants/stop_smoking_guide_spec.rb

describe 'A registered and consented participant signs in', type: :feature do
  context 'in English' do
    it 'navigates to the Stop Smoking Guide' do
      sign_in_pt_en(ENV['Pt_117_Email'], ENV['Pt_117_Password'])
      click_on 'Stop Smoking Guide'
      expect(page).to have_css('a', text: 'Why Should I Quit?')
      expect(page).to have_css('a', text: 'How Can I Quit?')
      expect(page).to have_css('a', text: 'What if I Start Smoking Again?')
      expect(page).to have_css('a', text: 'How do I Help Someone Quit?')
    end

    it 'navigates to How to Help guide' do
      sign_in_pt_en(ENV['Pt_118_Email'], ENV['Pt_118_Password'])
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How do I Help Someone Quit?'
      page.evaluate_script('window.history.back()') # remove when navigation fixed
      click_on 'How do I Help Someone Quit?' # remove when navigation fixed
      expect(page).to have_css('h2', text: 'How to help page 1 title')
      expect(page).to have_content 'How to help page 1 body'
    end

    it 'completes How to Help guide'
      # sign_in_pt_en(ENV['Pt_119_Email'], ENV['Pt_119_Password'])
      # visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      # click_on 'How do I Help Someone Quit?'
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on 'How do I Help Someone Quit?' # remove when navigation fixed
      # find('h2', text: 'How to help page 1 title')

    it 'navigates to How to Quit guide' do
      sign_in_pt_en(ENV['Pt_120_Email'], ENV['Pt_120_Password'])
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'How Can I Quit?'
      page.evaluate_script('window.history.back()') # remove when navigation fixed
      click_on 'How Can I Quit?' # remove when navigation fixed
      expect(page).to have_css('h2', text: 'How to quit page 1 title')
      expect(page).to have_content 'How to quit page 1 body'
    end

    it 'completes How to Quit guide'
      # sign_in_pt_en(ENV['Pt_121_Email'], ENV['Pt_121_Password'])
      # visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      # click_on 'How Can I Quit?'
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on 'How Can I Quit?' # remove when navigation fixed
      # find('h2', text: 'How to quit page 1 title')

    it 'navigates to What If guide' do
      sign_in_pt_en(ENV['Pt_122_Email'], ENV['Pt_122_Password'])
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'What if I Start Smoking Again?'
      page.evaluate_script('window.history.back()') # remove when navigation fixed
      click_on 'What if I Start Smoking Again?' # remove when navigation fixed
      expect(page).to have_css('h2', text: 'What if? page 1 title')
      expect(page).to have_content 'What if? page 1 body'
    end

    it 'completes What if guide'
      # sign_in_pt_en(ENV['Pt_123_Email'], ENV['Pt_123_Password'])
      # visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      # click_on 'What if I Start Smoking Again?'
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on 'What if I Start Smoking Again?' # remove when navigation fixed
      # find('h2', text: 'What if? page 1 title')

    it 'navigates to Why Quit guide' do
      sign_in_pt_en(ENV['Pt_124_Email'], ENV['Pt_124_Password'])
      visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      click_on 'Why Should I Quit?'
      page.evaluate_script('window.history.back()') # remove when navigation fixed
      click_on 'Why Should I Quit?' # remove when navigation fixed
      expect(page).to have_css('h2', text: 'Why Quit? page 1 title')
      expect(page).to have_content 'Why Quit? page 1 body'
    end

    it 'completes Why Quit guide'
      # sign_in_pt_en(ENV['Pt_125_Email'], ENV['Pt_125_Password'])
      # visit "#{ENV['Base_URL']}/#/en/stop-smoking-guide"
      # click_on 'Why Should I Quit?'
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on 'Why Should I Quit?' # remove when navigation fixed
      # find('h2', text: 'Why Quit? page 1 title')
  end

  context 'in Español' do
    it 'navigates to the Stop Smoking Guide'
    #   sign_in_pt_en(ENV['Pt_217_Email'], ENV['Pt_217_Password'])
    #   click_on ''
    #   expect(page).to have_css('a', text: '')
    #   expect(page).to have_css('a', text: '')
    #   expect(page).to have_css('a', text: '')
    #   expect(page).to have_css('a', text: '')
    # end

    it 'navigates to How to Help guide'
    #   sign_in_pt_en(ENV['Pt_218_Email'], ENV['Pt_218_Password'])
    #   visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
    #   click_on ''
    #   page.evaluate_script('window.history.back()') # remove when navigation fixed
    #   click_on '' # remove when navigation fixed
    #   expect(page).to have_css('h2', text: 'Como ayudar 1 título')
    #   expect(page).to have_content 'HComo ayudar 1 cuerpo'
    # end

    it 'completes How to Help guide'
      # sign_in_pt_en(ENV['Pt_219_Email'], ENV['Pt_219_Password'])
      # visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      # click_on ''
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on '' # remove when navigation fixed
      # find('h2', text: 'Como ayudar 1 título')

    it 'navigates to How to Quit guide'
    #   sign_in_pt_en(ENV['Pt_220_Email'], ENV['Pt_220_Password'])
    #   visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
    #   click_on ''
    #   page.evaluate_script('window.history.back()') # remove when navigation fixed
    #   click_on '' # remove when navigation fixed
    #   expect(page)
    #     .to have_css('h2', text: 'Cómo dejar de fumar página 1 título')
    #   expect(page).to have_content 'Cómo dejar de fumar página 1 cuerpo'
    # end

    it 'completes How to Quit guide'
      # sign_in_pt_en(ENV['Pt_221_Email'], ENV['Pt_221_Password'])
      # visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      # click_on ''
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on '' # remove when navigation fixed
      # find('h2', text: 'Cómo dejar de fumar página 1 título')

    it 'navigates to What If guide'
    #   sign_in_pt_en(ENV['Pt_222_Email'], ENV['Pt_222_Password'])
    #   visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
    #   click_on ''
    #   page.evaluate_script('window.history.back()') # remove when navigation fixed
    #   click_on '' # remove when navigation fixed
    #   expect(page).to have_css('h2', text: '¿Y sí? página 1 título')
    #   expect(page).to have_content '¿Y sí? página 1 cuerpo'
    # end

    it 'completes What if guide'
      # sign_in_pt_en(ENV['Pt_223_Email'], ENV['Pt_223_Password'])
      # visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      # click_on ''
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on '' # remove when navigation fixed
      # find('h2', text: '¿Y sí? página 1 título')

    it 'navigates to Why Quit guide'
    #   sign_in_pt_en(ENV['Pt_224_Email'], ENV['Pt_224_Password'])
    #   visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
    #   click_on ''
    #   page.evaluate_script('window.history.back()') # remove when navigation fixed
    #   click_on '' # remove when navigation fixed
    #   expect(page)
    #     .to have_css('h2', text: '¿Por qué dejar de fumar? página 1 título')
    #   expect(page).to have_content '¿Por qué dejar de fumar? página 1 cuerpo'
    # end

    it 'completes Why Quit guide'
      # sign_in_pt_en(ENV['Pt_225_Email'], ENV['Pt_225_Password'])
      # visit "#{ENV['Base_URL']}/#/es/stop-smoking-guide"
      # click_on ''
      # page.evaluate_script('window.history.back()') # remove when navigation fixed
      # click_on '' # remove when navigation fixed
      # find('h2', text: '¿Por qué dejar de fumar? página 1 título')
  end
end
