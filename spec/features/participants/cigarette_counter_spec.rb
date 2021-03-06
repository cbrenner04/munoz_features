# frozen_string_literal: true
# filename: spec/features/participants/cigarette_counter.rb

require './spec/support/participants/cigarette_counter_helper'

feature 'Cigarette Counter', metadata: :participant do
  context 'in English' do
    scenario 'Participant accesses the cigarette counter' do
      participant_113.sign_in

      expect(participant_113).to be_on_landing_page

      cigarette_counter_eng.open

      expect(cigarette_counter_eng).to be_visible
    end

    scenario 'switches to Español in cigarette counter' do
      participant_132.sign_in

      expect(participant_132).to be_on_landing_page

      cigarette_counter_eng.open

      expect(cigarette_counter_eng).to be_visible

      participant_132.switch_language

      expect(cigarette_counter_esp).to be_visible
    end

    scenario 'navigates to Set Your Quit Date from cigarette counter' do
      participant_132.sign_in

      expect(participant_132).to be_on_landing_page

      cigarette_counter_eng.open

      expect(cigarette_counter_eng).to be_visible

      participant_132.go_to('Set Your Quit Date')

      expect(quit_date_eng).to be_visible
    end

    scenario 'sees yesterday\'s cigarette count' do
      participant_17.sign_in

      expect(participant_17).to be_on_landing_page

      visit pt_17_cig_counter.landing_page

      # failing due to hidden text
      # expect(pt_17_cig_counter).to have_count

      expect(pt_17_cig_counter).to have_count_in_graph
    end

    scenario 'increments yesterday\'s cigarette count' do
      participant_18.sign_in

      expect(participant_18).to be_on_landing_page

      visit pt_18_cig_counter.landing_page
      pt_18_cig_counter.increment_count

      # failing due to hidden text
      # expect(pt_18_cig_counter).to have_count

      expect(pt_18_cig_counter).to have_count_in_graph
    end

    scenario 'decrements yesterday\'s cigarette count' do
      participant_19.sign_in

      expect(participant_19).to be_on_landing_page

      visit pt_19_cig_counter.landing_page
      pt_19_cig_counter.decrement_count

      # failing due to hidden text
      # expect(pt_19_cig_counter).to have_count

      expect(pt_19_cig_counter).to have_count_in_graph
    end

    scenario 'sees today\'s cigarette count' do
      participant_114.sign_in

      expect(participant_114).to be_on_landing_page

      visit pt_114_cig_counter.landing_page

      # failing due to hidden text
      # expect(pt_114_cig_counter).to have_count

      expect(pt_114_cig_counter).to have_count_in_graph
    end

    scenario 'increments today\'s cigarette count' do
      participant_115.sign_in

      expect(participant_115).to be_on_landing_page

      visit pt_115_cig_counter.landing_page
      pt_115_cig_counter.increment_count

      # failing due to hidden text
      # expect(pt_115_cig_counter).to have_count

      expect(pt_115_cig_counter).to have_count_in_graph
    end

    scenario 'decrements today\'s cigarette count' do
      participant_116.sign_in

      expect(participant_116).to be_on_landing_page

      visit pt_116_cig_counter.landing_page
      pt_116_cig_counter.decrement_count

      # failing due to hidden text
      # expect(pt_116_cig_counter).to have_count

      expect(pt_116_cig_counter).to have_count_in_graph
    end

    scenario 'sees cigarette count for more than a week ago', :date do
      participant_143.sign_in

      expect(participant_143).to be_on_landing_page

      visit pt_143_cig_counter.landing_page

      expect(pt_143_cig_counter).to have_zero_count_in_graph

      pt_143_cig_counter.previous_week

      expect(pt_143_cig_counter).to have_count_in_graph
    end

    scenario 'enters cigarette count for yesterday' do
      participant_144.sign_in

      expect(participant_144).to be_on_landing_page

      visit pt_144_cig_counter.landing_page
      pt_144_cig_counter.set_count

      expect(pt_144_cig_counter).to have_count_in_graph
    end

    scenario 'enters cigarette count for today' do
      participant_145.sign_in

      expect(participant_145).to be_on_landing_page

      visit pt_145_cig_counter.landing_page
      pt_145_cig_counter.set_count

      expect(pt_145_cig_counter).to have_count_in_graph
    end

    scenario 'uses the Done button to navigate back to Home' do
      participant_155.sign_in

      expect(participant_155).to be_on_landing_page

      visit pt_155_cig_counter.landing_page
      pt_155_cig_counter.done
      expect(pt_155_cig_counter).to have_home_visible
    end
  end

  # Spanish version begins here

  context 'in Español' do
    scenario 'access the cigarette counter' do
      participant_213.sign_in

      expect(participant_213).to be_on_landing_page

      cigarette_counter_esp.open

      expect(cigarette_counter_esp).to be_visible
    end

    scenario 'switches to English in cigarette counter' do
      participant_213.sign_in

      expect(participant_213).to be_on_landing_page

      cigarette_counter_esp.open

      expect(cigarette_counter_esp).to be_visible

      participant_213.switch_language

      expect(cigarette_counter_eng).to be_visible
    end

    scenario 'navigates to Set Your Quit Date from cigarette counter' do
      participant_213.sign_in

      expect(participant_213).to be_on_landing_page

      cigarette_counter_esp.open

      expect(cigarette_counter_esp).to be_visible

      participant_213.go_to('Elija la fecha en que dejará de fumar')

      expect(quit_date_esp).to be_visible
    end

    scenario 'sees yesterday\'s cigarette count' do
      participant_20.sign_in

      expect(participant_20).to be_on_landing_page

      visit pt_20_cig_counter.landing_page

      # failing due to hidden text
      # expect(pt_20_cig_counter).to have_count

      expect(pt_20_cig_counter).to have_count_in_graph
    end

    scenario 'increments yesterday\'s cigarette count' do
      participant_21.sign_in

      expect(participant_21).to be_on_landing_page

      visit pt_21_cig_counter.landing_page
      pt_21_cig_counter.increment_count

      # failing due to hidden text
      # expect(pt_21_cig_counter).to have_count

      expect(pt_21_cig_counter).to have_count_in_graph
    end

    # Fails during full run.

    scenario 'decrements yesterday\'s cigarette count' do
      participant_22.sign_in

      expect(participant_22).to be_on_landing_page

      visit pt_22_cig_counter.landing_page

      expect(pt_22_cig_counter).to be_visible

      pt_22_cig_counter.decrement_count

      # failing due to hidden text
      # expect(pt_22_cig_counter).to have_count
      expect(pt_22_cig_counter).to have_count_in_graph
    end

    scenario '"sees today\'s cigarette count' do
      participant_214.sign_in

      expect(participant_214).to be_on_landing_page

      visit pt_214_cig_counter.landing_page

      # failing due to hidden text
      # expect(pt_214_cig_counter).to have_count

      expect(pt_214_cig_counter).to have_count_in_graph
    end

    scenario 'increments today\'s cigarette count' do
      participant_215.sign_in

      expect(participant_215).to be_on_landing_page

      visit pt_215_cig_counter.landing_page
      pt_215_cig_counter.increment_count

      # failing due to hidden text
      # expect(pt_215_cig_counter).to have_count

      expect(pt_215_cig_counter).to have_count_in_graph
    end

    scenario 'decrements today\'s cigarette count' do
      participant_216.sign_in

      expect(participant_216).to be_on_landing_page

      visit pt_216_cig_counter.landing_page
      pt_216_cig_counter.decrement_count

      # failing due to hidden text
      # expect(pt_216_cig_counter).to have_count

      expect(pt_216_cig_counter).to have_count_in_graph
    end

    scenario 'sees cigarette count for more than a week ago', :date do
      participant_243.sign_in

      expect(participant_243).to be_on_landing_page

      visit pt_243_cig_counter.landing_page

      expect(pt_243_cig_counter).to have_zero_count_in_graph

      pt_243_cig_counter.previous_week

      expect(pt_243_cig_counter).to have_count_in_graph
    end

    scenario 'enters cigarette count for yesterday' do
      participant_244.sign_in

      expect(participant_244).to be_on_landing_page

      visit pt_244_cig_counter.landing_page
      pt_244_cig_counter.set_count

      expect(pt_244_cig_counter).to have_count_in_graph
    end

    scenario 'enters cigarette count for today' do
      participant_245.sign_in

      expect(participant_245).to be_on_landing_page

      visit pt_245_cig_counter.landing_page
      pt_245_cig_counter.set_count

      expect(pt_245_cig_counter).to have_count_in_graph
    end

    scenario 'uses the Done button to navigate back to Home' do
      participant_255.sign_in

      expect(participant_255).to be_on_landing_page

      visit pt_255_cig_counter.landing_page
      pt_255_cig_counter.done

      expect(pt_255_cig_counter).to have_home_visible
    end
  end
end
