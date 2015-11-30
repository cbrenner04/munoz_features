# filename: spec/features/participants/quit_date_spec.rb

describe 'A registered and consented participant signs in',
         type: :feature, metadata: :participant do
  context 'in English' do
    it 'navigates to Your Quit Date' do
      sign_in_pt_en('133')
      click_on 'Set Your Quit Date'
      expect(page).to have_css '.previous'
    end

    it 'switches to Español while in Your Quit Date' do
      sign_in_pt_en('134')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding.ng-scope', text: 'We')
      go_to('Español')
      expect(page).to have_css('.ng-binding.ng-scope', text: 'Mi')
    end

    it 'navigates to Cigarette Counter from Set Your Quit Date' do
      sign_in_pt_en('134')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding.ng-scope', text: 'We')
      navigate_to('Cigarette Counter')
      expect(page).to have_css('.pull-left', text: 'Yesterday')
    end

    it "sees today's date highlighted", :date do
      sign_in_pt_en('135')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
      d = Date.parse("#{Date.today}")
      num = d.mday
      wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
      if num.between?(1, 9) || num.between?(30, 31) ||
         num >= 23 && page.has_text?("#{num}", count: 2)
        if num == 2
          if page.has_no_text?('29', count: 2)
            feb(num)
          else
            not_feb(num)
          end
        elsif num == 3
          if wrong_date.to_i == 3
            first('.text-right.ng-binding.ng-scope', text: "#{num}")
              .native.style('font-weight').should eq('bold')
          elsif wrong_date.to_i >= 30
            selection = page.all('.text-right.ng-binding.ng-scope',
                                 text: "#{num}")[2]
            selection.native.style('font-weight').should eq('bold')
          elsif wrong_date.to_i == 23
            odd_day(num)
          end
        elsif page.has_no_text?(num, count: 2)
          first('.text-right.ng-binding.ng-scope', text: "#{num}")
            .native.style('font-weight').should eq('bold')
        else
          selection = page.all('.text-right.ng-binding.ng-scope',
                               text: "#{num}")[1]
          selection.native.style('font-weight').should eq('bold')
        end
      else
        find('.text-right.ng-binding.ng-scope', text: "#{num}")
          .native.style('font-weight').should eq('bold')
      end
    end

    it 'navigates to previous month within Your Quit Date' do
      sign_in_pt_en('136')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
      find('a', text: 'Prev.').click
      last_month = Date.today - 30
      expect(page)
        .to have_css('.ng-binding', text: "#{last_month.strftime('%b %Y')}")
    end

    it 'navigates to next month within Your Quit Date' do
      sign_in_pt_en('137')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
      find('a', text: 'Next').click
      d = Date.parse("#{Date.today}")
      num = d.mday
      if num.between?(30, 31)
        next_month = Date.today + 27
      else
        next_month = Date.today + 32
      end
      expect(page)
        .to have_css('.ng-binding', text: "#{next_month.strftime('%b %Y')}")
    end

    it 'navigates back to Today from another month' do
      sign_in_pt_en('137')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
      find('a', text: 'Next').click
      d = Date.parse("#{Date.today}")
      num = d.mday
      if num.between?(30, 31)
        next_month = Date.today + 27
      else
        next_month = Date.today + 32
      end
      find('.ng-binding', text: "#{next_month.strftime('%b %Y')}")
      find('a', text: 'Today').click
      expect(page)
        .to have_css('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
    end

    it 'sets a Quit Date', :date do
      sign_in_pt_en('139')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      select_day("#{tomorrow}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tomorrow.strftime('%-d')}")
    end

    it 'sets initial Quit Date, does not see link to quit date on main page' do
      sign_in_pt_en('149')
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      expect('.dropdown-menu')
        .to_not have_css('.ng-binding', text: 'Set Your Quit Date')

      find('a', text: 'Set Your Quit Date').click
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      select_day("#{tomorrow}")
      find('h3', text: "#{tomorrow.strftime('%B %-d, %Y')}")

      visit ENV['Base_URL']
      find('a', text: 'Cigarette Counter')
      expect(page).to_not have_content 'Set Your Quit Date'
    end

    it 'sets a Quit Date, chooses Done to return to home page' do
      sign_in_pt_en('154')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      expect(page).to_not have_css('.btn.btn-default', text: 'Done')
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      select_day("#{tomorrow}")
      find('.btn.btn-default', text: 'Done').click
      expect(page).to have_content 'Stop Smoking Guide'
    end

    it 'has a Quit Date set, cannot access Quit Date except through navbar' do
      sign_in_pt_en('150')
      expect(page).to_not have_css('a', text: 'Set Your Quit Date')
      go_to('Set Your Quit Date')
      tomorrow = Date.today + 1
      expect(page).to have_css('h3', text: "#{tomorrow.strftime('%B %-d, %Y')}")
    end

    it 'cannot set a Quit Date in the past', :date do
      sign_in_pt_en('134')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      yesterday = Date.today - 1
      unless page.has_css?('.ng-binding',
                           text: "#{yesterday.strftime('%b %Y')}")
        find('a', text: 'Prev.').click
      end

      select_day("#{yesterday}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{yesterday.strftime('%-d')}")
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end
      select_day("#{tomorrow}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tomorrow.strftime('%-d')}")
    end

    it 'sees Quit Date highlighted' do
      sign_in_pt_en('141')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tomorrow.strftime('%-d')}")
    end

    it 'sees Quit Date at the top of page' do
      sign_in_pt_en('141')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      expect(page)
        .to have_css('h3', text: "Date: #{tomorrow.strftime('%B %-d')}")
    end

    it 'updates a Quit Date', :date do
      sign_in_pt_en('142')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tomorrow.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      find('.text-right.ng-binding.ng-scope.success',
           text: "#{tomorrow.strftime('%-d')}")
      two_days = Date.today + 2
      unless page.has_css?('.ng-binding', text: "#{two_days.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      select_day("#{two_days}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{two_days.strftime('%-d')}")
    end

    it 'cannot set a quit date more than 4 weeks from today', :date do
      sign_in_pt_en('133')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      beyond_four_wks = Date.today + 30
      unless page.has_css?('.ng-binding',
                           text: "#{beyond_four_wks.strftime('%b %Y')}")
        find('a', text: 'Next').click
      end

      select_day("#{beyond_four_wks}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{beyond_four_wks.strftime('%-d')}")

      under_four_wks = Date.today + 25
      unless page.has_css?('.ng-binding',
                           text: "#{under_four_wks.strftime('%b %Y')}")
        find('a', text: 'Prev').click
      end
      select_day("#{under_four_wks}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{under_four_wks.strftime('%-d')}")
    end
  end

  context 'in Español' do
    it 'navigates to Your Quit Date' do
      sign_in_pt_es('233')
      click_on 'Elija la fecha en que dejará de fumar'
      expect(page).to have_css '.previous'
    end

    it 'switches to English while in Your Quit Date' do
      sign_in_pt_es('234')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding.ng-scope', text: 'Mi')
      go_to('English')
      expect(page).to have_css('.ng-binding.ng-scope', text: 'We')
    end

    it 'navigates to Cigarette Counter from Set Your Quit Date' do
      sign_in_pt_es('234')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding.ng-scope', text: 'Mi')
      navigate_to('Contador de Cigarrillos')
      expect(page).to have_css('.pull-left', text: 'Ayer')
    end

    it "sees today's date highlighted" do
      sign_in_pt_es('235')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      d = Date.parse("#{Date.today}")
      num = d.mday
      wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
      if num.between?(1, 9) || num.between?(30, 31) ||
         num >= 23 && page.has_text?("#{num}", count: 2)
        if num == 2
          if page.has_no_text?('29', count: 2)
            feb(num)
          else
            not_feb(num)
          end
        elsif num == 3
          if wrong_date.to_i == 3
            first('.text-right.ng-binding.ng-scope', text: "#{num}")
              .native.style('font-weight').should eq('bold')
          elsif wrong_date.to_i >= 30
            selection = page.all('.text-right.ng-binding.ng-scope',
                                 text: "#{num}")[2]
            selection.native.style('font-weight').should eq('bold')
          elsif wrong_date.to_i == 23
            odd_day(num)
          end
        elsif page.has_no_text?(num, count: 2)
          first('.text-right.ng-binding.ng-scope', text: "#{num}")
            .native.style('font-weight').should eq('bold')
        else
          selection = page.all('.text-right.ng-binding.ng-scope',
                               text: "#{num}")[1]
          selection.native.style('font-weight').should eq('bold')
        end
      else
        find('.text-right.ng-binding.ng-scope', text: "#{num}")
          .native.style('font-weight').should eq('bold')
      end
    end

    it 'navigates to previous month within Your Quit Date' do
      sign_in_pt_es('236')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      find('a', text: 'Volver').click
      last_month = Date.today - 30
      expect(page)
        .to have_css('.ng-binding',
                     text: trans_mo("#{last_month.strftime('%b. %Y')}"))
    end

    it 'navigates to next month within Your Quit Date' do
      sign_in_pt_es('237')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      find('a', text: 'Sig.').click
      d = Date.parse("#{Date.today}")
      num = d.mday
      if num.between?(30, 31)
        next_month = Date.today + 27
      else
        next_month = Date.today + 32
      end

      expect(page)
        .to have_css('.ng-binding',
                     text: trans_mo("#{next_month.strftime('%b. %Y')}"))
    end

    it 'navigates back to Today from another month' do
      sign_in_pt_es('237')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding',
           text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
      find('a', text: 'Sig.').click
      d = Date.parse("#{Date.today}")
      num = d.mday
      if num.between?(30, 31)
        next_month = Date.today + 27
      else
        next_month = Date.today + 32
      end
      find('.ng-binding',
           text: trans_mo("#{next_month.strftime('%b. %Y')}"))
      find('a', text: 'Hoy').click
      expect(page)
        .to have_css('.ng-binding',
                     text: trans_mo("#{Date.today.strftime('%b. %Y')}"))
    end

    it 'sees Quit Date highlighted' do
      sign_in_pt_es('241')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    it 'sees Quit Date at the top of page' do
      sign_in_pt_es('241')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      expect(page)
        .to have_css('h3', text: "Dejará de Fumar: #{tom.strftime('%-d')}")
    end

    it 'sets a Quit Date' do
      sign_in_pt_es('239')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      select_day("#{tom}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    it 'sets initial Quit Date, does not see link to quit date on main page' do
      sign_in_pt_es('249')
      find('.navbar-toggle').click
      find('.dropdown-toggle').click
      expect('.dropdown-menu')
        .to_not have_css('.ng-binding',
                         text: 'Elija la fecha en que dejará de fumar')

      find('a', text: 'Elija la fecha en que dejará de fumar').click
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      select_day("#{tom}")
      find('h3', text: "#{tom.strftime('%-d')}")

      visit ENV['Base_URL']
      find('a', text: 'Contador de Cigarrillos')
      expect(page).to_not have_content 'Elija la fecha en que dejará de fumar'
    end

    it 'sets a Quit Date, chooses Done to return to home page' do
      sign_in_pt_en('254')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      expect(page).to_not have_css('.btn.btn-default', text: 'Done')
      tomorrow = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tomorrow.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      select_day("#{tomorrow}")
      find('.btn.btn-default', text: 'Fijar').click
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end

    it 'has a Quit Date set, cannot access Quit Date except through navbar' do
      sign_in_pt_es('250')
      expect(page)
        .to_not have_css('a', text: 'Elija la fecha en que dejará de fumar')
      go_to('Elija la fecha en que dejará de fumar')
      tomorrow = Date.today + 1
      expect(page).to have_css('h3', text: "#{tomorrow.strftime('%-d')}")
    end

    it 'cannot set a Quit Date in the past' do
      sign_in_pt_es('234')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      yes = Date.today - 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{yes.strftime('%b. %Y')}"))
        find('a', text: 'Volver').click
      end

      select_day("#{yes}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{yes.strftime('%-d')}")
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end
      select_day("#{tom}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    it 'updates a Quit Date' do
      sign_in_pt_es('242')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding',
                           text: trans_mo("#{tom.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      find('.text-right.ng-binding.ng-scope.success',
           text: "#{tom.strftime('%-d')}")
      two_day = Date.today + 2
      unless page
             .has_css?('.ng-binding',
                       text: trans_mo("#{two_day.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      select_day("#{two_day}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{two_day.strftime('%-d')}")
    end

    it 'cannot set a quit date more than 4 weeks from today' do
      sign_in_pt_en('233')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      beyond_four_wks = Date.today + 30
      unless page
             .has_css?('.ng-binding',
                       text: trans_mo("#{beyond_four_wks.strftime('%b. %Y')}"))
        find('a', text: 'Sig.').click
      end

      select_day("#{beyond_four_wks}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{beyond_four_wks.strftime('%-d')}")

      under_four_wks = Date.today + 25
      unless page
             .has_css?('.ng-binding',
                       text: trans_mo("#{under_four_wks.strftime('%b. %Y')}"))
        find('a', text: 'Volver').click
      end
      select_day("#{under_four_wks}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{under_four_wks.strftime('%-d')}")
    end
  end
end

def select_day(date)
  d = Date.parse(date)
  num = d.mday
  if num.between?(1, 9) || num.between?(30, 31) ||
     num >= 23 && page.has_text?("#{num}", count: 2)
    unusual_day(num)
  else
    find('.text-right.ng-binding.ng-scope', text: "#{num}").click
  end
end

def unusual_day(num)
  if num == 2
    unusual_day_2(num)
  elsif num == 3
    unusual_day_3(num)
  elsif page.has_no_text?(num, count: 2)
    first('.text-right.ng-binding.ng-scope', text: "#{num}").click
  else
    calendar_date(num, 1)
  end
end

def unusual_day_2(num)
  if page.has_no_text?('29', count: 2)
    february(num)
  else
    not_february(num)
  end
end

def unusual_day_3(num)
  wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
  if wrong_date.to_i == 3
    first('.text-right.ng-binding.ng-scope', text: "#{num}").click
  elsif wrong_date.to_i >= 30
    calendar_date(num, 2)
  elsif wrong_date.to_i == 23
    unusual_day_4(num)
  end
end

def unusual_day_4(num)
  if page.has_no_text?('30', count: 2)
    calendar_date(num, 1)
  elsif page.has_text?('30', count: 2) && page.has_no_text?('31', count: 2)
    calendar_date(num, 2)
  elsif page.has_text?('30', count: 2) && page.has_text?('31', count: 2)
    calendar_date(num, 3)
  end
end

def february(num)
  wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
  if wrong_date.to_i.between?(23, 28)
    wrong_date_replacements = { 23 => 6, 24 => 5, 25 => 4, 26 => 3,
                                27 => 2, 28 => 1 }
    calendar_date(num, wrong_date_replacements[wrong_date.to_i])
  else
    calendar_date(num, 0)
  end
end

def not_february(num)
  wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
  if wrong_date.to_i.between?(23, 29)
    wrong_date_replacements = { 23 => 7, 24 => 6, 25 => 5, 26 => 4, 27 => 3,
                                28 => 2, 29 => 1 }
    calendar_date(num, wrong_date_replacements[wrong_date.to_i])
  else
    calendar_date(num, 0)
  end
end

def calendar_date(num, y)
  selection = page.all('.text-right.ng-binding.ng-scope', text: "#{num}")[y]
  selection.click
end

def feb(num)
  wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
  if wrong_date.to_i.between?(23, 28)
    wrong_date_reps = { 23 => 6, 24 => 5, 25 => 4, 26 => 3, 27 => 2,
                        28 => 1 }
    sel = page.all('.text-right.ng-binding.ng-scope',
                   text: "#{num}")[wrong_date_reps[wrong_date.to_i]]
    sel.native.style('font-weight').should eq('bold')
  else
    selection = page.all('.text-right.ng-binding.ng-scope',
                         text: "#{num}")[0]
    selection.native.style('font-weight').should eq('bold')
  end
end

def not_feb(num)
  if wrong_date.to_i.between?(23, 29)
    wrong_date_reps = { 23 => 7, 24 => 6, 25 => 5, 26 => 4, 27 => 3,
                        28 => 2, 29 => 1 }
    sel = page.all('.text-right.ng-binding.ng-scope',
                   text: "#{num}")[wrong_date_reps[wrong_date.to_i]]
    sel.native.style('font-weight').should eq('bold')
  else
    selection = page.all('.text-right.ng-binding.ng-scope',
                         text: "#{num}")[0]
    selection.native.style('font-weight').should eq('bold')
  end
end

def odd_day(num)
  if page.has_no_text?('30', count: 2)
    selection = page.all('.text-right.ng-binding.ng-scope',
                         text: "#{num}")[1]
    selection.native.style('font-weight').should eq('bold')
  elsif page.has_text?('30', count: 2) &&
        page.has_no_text?('31', count: 2)
    selection = page.all('.text-right.ng-binding.ng-scope',
                         text: "#{num}")[2]
    selection.native.style('font-weight').should eq('bold')
  elsif page.has_text?('30', count: 2) && page.has_text?('31', count: 2)
    selection = page.all('.text-right.ng-binding.ng-scope',
                         text: "#{num}")[3]
    selection.native.style('font-weight').should eq('bold')
  end
end
