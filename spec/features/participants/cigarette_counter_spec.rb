# filename: spec/features/participants/cigarette_counter.rb

require './spec/support/participants_helper'
require './spec/support/participants/cigarette_counter_helper'

feature 'Cigarette Counter', metadata: :participant do
  context 'in English' do

    scenario 'Participant accesses the cigarette counter' do
      participant_113.sign_in_pt_en
      cigarette_counter.open

      expect(cigarette_counter).to be_visible_in_eng
    end

    scenario 'switches to Español in cigarette counter' do
      participant_132.sign_in_pt_en
      cigarette_counter.open

      expect(cigarette_counter).to be_visible_in_eng

      participant_132.go_to('Español')

      expect(cigarette_counter).to be_visible_in_esp
    end

    scenario 'navigates to Set Your Quit Date from cigarette counter' do
      participant_132.sign_in_pt_en
      cigarette_counter.open

      expect(cigarette_counter).to be_visible_in_eng

      participant_132.go_to('Set Your Quit Date')
      
      expect(set_your_quit_date).to be_visible_in_eng
    end

    scenario 'sees yesterday\'s cigarette count' do
      participant_17.sign_in_pt_en
      visit pt_17_cig_counter.landing_page

      expect(pt_17_cig_counter).to have_count

      expect(pt_17_cig_counter).to have_count_in_graph
    end

    scenario 'increments yesterday\'s cigarette count' do
      participant_18.sign_in_pt_en
      visit pt_18_cig_counter.landing_page
      pt_18_cig_counter.increment_count

      expect(pt_18_cig_counter).to have_count

      expect(pt_18_cig_counter).to have_count_in_graph
    end

    scenario 'decrements yesterday\'s cigarette count' do
      participant_19.sign_in_pt_en
      visit pt_19_cig_counter.landing_page
      pt_19_cig_counter.decrement_count

      expect(pt_19_cig_counter).to have_count

      expect(pt_19_cig_counter).to have_count_in_graph
    end

    scenario 'sees today\'s cigarette count' do
      participant_114.sign_in_pt_en
      visit pt_114_cig_counter.landing_page

      expect(pt_114_cig_counter).to have_count

      expect(pt_114_cig_counter).to have_count_in_graph
      end
    end

    scenario 'increments today\'s cigarette count' do
      participant_115.sign_in_pt_en
      visit pt_115_cig_counter.landing_page
      pt_115_cig_counter.increment_count

      expect(pt_115_cig_counter).to have_count
      
      expect(pt_115_cig_counter).to have_count_in_graph
    end

    scenario 'decrements today\'s cigarette count' do
      participant_116.sign_in_pt_en
      visit pt_116_cig_counter.landing_page
      pt_116_cig_counter.decrement_count

      expect(pt_116_cig_counter).to have_count
      
      expect(pt_116_cig_counter).to have_count_in_graph
    end

    #code below this point needs POM revision.

    scenario 'sees cigarette count for more than a week ago', :date do
      participant_143.sign_in_pt_en
      visit pt_143_cig_counter.landing_page

#remember to switch have to has (content/text)
      #best way to def this?
      today = Date.today.strftime('%d').to_i
      #just move this into its own method. should I include the above?
      if today.between?(1, 6) && page.has_text?('30')
        expect(page).to have_content('0', count: 8)
      elsif today.between?(10, 16) || today.between?(20, 26) || today >= 30
        expect(page).to have_content('0', count: 8)
      else
        expect(page).to have_content('0', count: 7)
      end
      #alittl lost on this one, seems it mught break the methods I already have.
      find('#previous-week').click
      prev_day = Date.today - 9
      
      expect(pt_143_cig_counter).to have_count_in_graph
    end

    scenario 'enters cigarette count for yesterday' do
      participant_144.sign_in_pt_en
      visit pt_144_cig_counter.landing_page

      within('.pull-left', text: 'Yesterday') do
        find('input[type = tel]').set('5')
      end

      expect(pt_144_cig_counter).to have_count_in_graph
    end

    scenario 'enters cigarette count for today' do
      participant_145.sign_in_pt_en
      visit pt_145_cig_counter.landing_page

      within('.pull-left', text: 'Today') do
        find('input[type = tel]').set('5')
      end
      
      expect(pt_145_cig_counter).to have_count_in_graph
    end

    scenario 'uses the Done button to navigate back to Home' do
      participant_155.sign_in_pt_en
      visit pt_155_cig_counter.landing_page

      find('.pull-left', text: 'Yesterday')
      find('.btn.btn-default', text: 'Done').click
      expect(page).to have_content 'Stop Smoking Guide'
    end
  end

#Spanish version begins here -- got to another file

  context 'in Español' do
    scenario 'access the cigarette counter' do
      participant_213.sign_in_pt_es
      click_on 'Contador de Cigarrillos'
      expect(page).to have_content 'Ayer'
      expect(page).to have_css '.btn-group-vertical'
    end

    scenario 'switches to English in cigarette counter' do
      participant_213.sign_in_pt_es
      click_on 'Contador de Cigarrillos'
      find('.pull-left', text: 'Ayer')
      go_to('English')
      expect(page).to have_content 'Yesterday'
    end

    scenario 'navigates to Set Your Quit Date from cigarette counter' do
      participant_213.sign_in_pt_es
      click_on 'Contador de Cigarrillos'
      find('.pull-left', text: 'Ayer')
      go_to('Elija la fecha en que dejará de fumar')
      expect(page).to have_css '.previous'
    end

    scenario 'sees yesterday\'s cigarette count' do
      participant_20.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Ayer') do
        find('input[type = tel]').value.should eq '15'
      end
      yesterday = Date.today - 1
      within('g', text: trans_mo("#{yesterday.strftime('%-d %b.')}")) do
        expect(page).to have_content '15'
      end
    end

    scenario 'increments yesterday\'s cigarette count' do
      participant_21.sign_in_pt_es
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

    scenario 'decrements yesterday\'s cigarette count' do
      participant_22.sign_in_pt_es
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

    scenario '"sees today\'s cigarette count' do
      participant_214.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('input[type = tel]').value.should eq '15'
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '15'
      end
    end

    scenario 'increments today\'s cigarette count' do
      participant_215.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('.btn.btn-lg.btn-default', text: '+').click
        find('input[type = tel]').value.should eq '16'
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '16'
      end
    end

    scenario 'decrements today\'s cigarette count' do
      participant_216.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('.btn.btn-lg.btn-default', text: '-').click
        find('input[type = tel]').value.should eq '14'
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '14'
      end
    end

    scenario 'sees cigarette count for more than a week ago', :date do
      participant_243.sign_in_pt_es
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

    scenario 'enters cigarette count for yesterday' do
      participant_244.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Ayer') do
        find('input[type = tel]').set('5')
      end
      yesterday = Date.today - 1
      within('g', text: trans_mo("#{yesterday.strftime('%-d %b.')}")) do
        expect(page).to have_content '5'
      end
    end

    scenario 'enters cigarette count for today' do
      participant_245.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      within('.pull-left', text: 'Hoy') do
        find('input[type = tel]').set('5')
      end
      within('g', text: trans_mo("#{Date.today.strftime('%-d %b.')}")) do
        expect(page).to have_content '5'
      end
    end

    scenario 'uses the Done button to navigate back to Home' do
      participant_255.sign_in_pt_es
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.pull-left', text: 'Ayer')
      find('.btn.btn-default', text: 'Fijar').click
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end
  end
end
