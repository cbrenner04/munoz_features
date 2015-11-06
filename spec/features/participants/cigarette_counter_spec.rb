# filename: spec/features/participants/cigarette_counter.rb

describe 'A registered and consented participant signs in',
         type: :feature, metadata: :participant do
  context 'in English' do
    it 'accesses the cigarette counter' do
      sign_in_pt_en('113')
      click_on 'Cigarette Counter'
      expect(page).to have_content 'Yesterday'
      expect(page).to have_css '.btn-group-vertical'
    end

    it 'switches to Español in cigarette counter' do
      sign_in_pt_en('132')
      click_on 'Cigarette Counter'
      find('.pull-left', text: 'Yesterday')
      go_to('Español')
      expect(page).to have_content 'Ayer'
    end

    it 'navigates to Set Your Quit Date from cigarette counter' do
      sign_in_pt_en('132')
      click_on 'Cigarette Counter'
      find('.pull-left', text: 'Yesterday')
      go_to('Set Your Quit Date')
      expect(page).to have_css '.previous'
    end

    it "sees yesterday's cigarette count" do
      sign_in_pt_en('17')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Yesterday') do
        find('input[type = tel]').value.should eq '15'
      end
      yesterday = Date.today - 1
      within('g', text: "#{yesterday.strftime('%b %-d')}") do
        expect(page).to have_content '15'
      end
    end

    it "increments yesterday's cigarette count" do
      sign_in_pt_en('18')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Yesterday') do
        find('.btn.btn-lg.btn-default', text: '+').click
        find('input[type = tel]').value.should eq '16'
      end
      yesterday = Date.today - 1
      within('g', text: "#{yesterday.strftime('%b %-d')}") do
        expect(page).to have_content '16'
      end
    end

    it "decrements yesterday's cigarette count" do
      sign_in_pt_en('19')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Yesterday') do
        find('.btn.btn-lg.btn-default', text: '-').click
        find('input[type = tel]').value.should eq '14'
      end
      yesterday = Date.today - 1
      within('g', text: "#{yesterday.strftime('%b %-d')}") do
        expect(page).to have_content '14'
      end
    end

    it "sees today's cigarette count" do
      sign_in_pt_en('114')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Today') do
        find('input[type = tel]').value.should eq '15'
      end
      within('g', text: "#{Date.today.strftime('%b %-d')}") do
        expect(page).to have_content '15'
      end
    end

    it "increments today's cigarette count" do
      sign_in_pt_en('115')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Today') do
        find('.btn.btn-lg.btn-default', text: '+').click
        find('input[type = tel]').value.should eq '16'
      end
      within('g', text: "#{Date.today.strftime('%b %-d')}") do
        expect(page).to have_content '16'
      end
    end

    it "decrements today's cigarette count" do
      sign_in_pt_en('116')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Today') do
        find('.btn.btn-lg.btn-default', text: '-').click
        find('input[type = tel]').value.should eq '14'
      end
      within('g', text: "#{Date.today.strftime('%b %-d')}") do
        expect(page).to have_content '14'
      end
    end

    it 'sees cigarette count for more than a week ago', :date do
      sign_in_pt_en('143')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      today = Date.today.strftime('%d').to_i
      if today.between?(1, 6) && page.has_text?('30')
        expect(page).to have_content('0', count: 8)
      elsif today.between?(10, 16) || today.between?(20, 26) || today >= 30
        expect(page).to have_content('0', count: 8)
      else
        expect(page).to have_content('0', count: 7)
      end
      find('#previous-week').click
      prev_day = Date.today - 9
      within('g', text: "#{prev_day.strftime('%b %-d')}") do
        expect(page).to have_content '15'
      end
    end

    it 'enters cigarette count for yesterday' do
      sign_in_pt_en('144')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Yesterday') do
        find('input[type = tel]').set('5')
      end
      yesterday = Date.today - 1
      within('g', text: "#{yesterday.strftime('%b %-d')}") do
        expect(page).to have_content '5'
      end
    end

    it 'enters cigarette count for today' do
      sign_in_pt_en('145')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      within('.pull-left', text: 'Today') do
        find('input[type = tel]').set('5')
      end
      within('g', text: "#{Date.today.strftime('%b %-d')}") do
        expect(page).to have_content '5'
      end
    end

    it 'uses the Done button to navigate back to Home' do
      sign_in_pt_en('155')
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.pull-left', text: 'Yesterday')
      find('.btn.btn-default', text: 'Done').click
      expect(page).to have_content 'Stop Smoking Guide'
    end
  end

  context 'in Español' do
    it 'access the cigarette counter' do
      sign_in_pt_es('213')
      click_on 'Contador de Cigarrillos'
      expect(page).to have_content 'Ayer'
      expect(page).to have_css '.btn-group-vertical'
    end

    it 'switches to English in cigarette counter' do
      sign_in_pt_es('213')
      click_on 'Contador de Cigarrillos'
      find('.pull-left', text: 'Ayer')
      go_to('English')
      expect(page).to have_content 'Yesterday'
    end

    it 'navigates to Set Your Quit Date from cigarette counter' do
      sign_in_pt_es('213')
      click_on 'Contador de Cigarrillos'
      find('.pull-left', text: 'Ayer')
      go_to('Elija la fecha en que dejará de fumar')
      expect(page).to have_css '.previous'
    end

    it "sees yesterday's cigarette count" do
      sign_in_pt_es('20')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Ayer') do
        find('input[type = tel]').value.should eq '15'
      end
      yesterday = Date.today - 1
      within('g', text: trans_mo("#{yesterday.strftime('%-d %b.')}")) do
        expect(page).to have_content '15'
      end
    end

    it "increments yesterday's cigarette count" do
      sign_in_pt_es('21')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Ayer') do
        find('.btn.btn-lg.btn-default', text: '+').click
        find('input[type = tel]').value.should eq '16'
      end
      yesterday = Date.today - 1
      within('g', text: trans_mo("#{yesterday.strftime('%-d %b.')}")) do
        expect(page).to have_content '16'
      end
    end

    it "decrements yesterday's cigarette count" do
      sign_in_pt_es('22')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Ayer') do
        find('.btn.btn-lg.btn-default', text: '-').click
        find('input[type = tel]').value.should eq '14'
      end
      yesterday = Date.today - 1
      within('g', text: trans_mo("#{yesterday.strftime('%-d %b.')}")) do
        expect(page).to have_content '14'
      end
    end

    it "sees today's cigarette count" do
      sign_in_pt_es('214')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('input[type = tel]').value.should eq '15'
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '15'
      end
    end

    it "increments today's cigarette count" do
      sign_in_pt_es('215')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('.btn.btn-lg.btn-default', text: '+').click
        find('input[type = tel]').value.should eq '16'
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '16'
      end
    end

    it "decrements today's cigarette count" do
      sign_in_pt_es('216')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('.btn.btn-lg.btn-default', text: '-').click
        find('input[type = tel]').value.should eq '14'
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '14'
      end
    end

    it 'sees cigarette count for more than a week ago', :date do
      sign_in_pt_es('243')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      today = Date.today.strftime('%d').to_i
      if today.between?(1, 6) && page.has_text?('30')
        expect(page).to have_content('0', count: 8)
      elsif today.between?(10, 16) || today.between?(20, 26) || today >= 30
        expect(page).to have_content('0', count: 8)
      else
        expect(page).to have_content('0', count: 7)
      end
      find('#previous-week').click
      prev_day = Date.today - 9
      within('g', text: trans_mo("#{prev_day.strftime('%-d %b.')}")) do
        expect(page).to have_content '15'
      end
    end

    it 'enters cigarette count for yesterday' do
      sign_in_pt_es('244')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Ayer') do
        find('input[type = tel]').set('5')
      end
      yesterday = Date.today - 1
      within('g', text: trans_mo("#{yesterday.strftime('%-d %b.')}")) do
        expect(page).to have_content '5'
      end
    end

    it 'enters cigarette count for today' do
      sign_in_pt_es('245')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('input[type = tel]').set('5')
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '5'
      end
    end

    it 'uses the Done button to navigate back to Home' do
      sign_in_pt_en('255')
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.pull-left', text: 'Ayer')
      find('.btn.btn-default', text: 'Fijar').click
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end
  end
end
