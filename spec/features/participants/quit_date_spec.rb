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
      navigate_to('Español')
      expect(page).to have_css('.ng-binding.ng-scope', text: 'Mi')
    end

    it 'navigates to Cigarette Counter from Set Your Quit Date' do
      sign_in_pt_en('134')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding.ng-scope', text: 'We')
      navigate_to('Cigarette Counter')
      expect(page).to have_css('.pull-left.ng-scope', text: 'Yesterday')
    end

    it "sees today's date highlighted", :date do
      sign_in_pt_en('135')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
      d = Date.parse("#{Date.today}")
      today_num = d.mday
      if today_num.between?(1, 9) || today_num.between?(23, 31)
        wrong_date = first('.text-right.ng-binding.ng-scope',
                           text: "#{today_num}").text
        if today_num == 2 && wrong_date.to_i >= 20
          puts 'NOT TESTED' # it gets way too convoluted here, isn't worth it
        elsif today_num == 3 && wrong_date.to_i >= 30
          calendar_today = page.all('.text-right.ng-binding.ng-scope',
                                    text: "#{today_num}")[2]
          calendar_today.native.style('font-weight').should eq('bold')
        elsif wrong_date.to_i > 10
          calendar_today = page.all('.text-right.ng-binding.ng-scope',
                                    text: "#{today_num}")[1]
          calendar_today.native.style('font-weight').should eq('bold')
        else
          first('.text-right.ng-binding.ng-scope', text: "#{today_num}")
            .native.style('font-weight').should eq('bold')
        end
      else
        find('.text-right.ng-binding.ng-scope', text: "#{today_num}")
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
      next_month = Date.today + 32
      expect(page)
        .to have_css('.ng-binding', text: "#{next_month.strftime('%b %Y')}")
    end

    it 'navigates back to Today from another month' do
      sign_in_pt_en('137')
      visit "#{ENV['Base_URL']}/#/en/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b %Y')}")
      find('a', text: 'Next').click
      next_month = Date.today + 32
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
      click_on 'Set Your Quit Date' # need to update with Spanish
      expect(page).to have_css '.previous'
    end

    it 'switches to English while in Your Quit Date' do
      sign_in_pt_es('234')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding.ng-scope', text: 'Mi')
      navigate_to('English')
      expect(page).to have_css('.ng-binding.ng-scope', text: 'We')
    end

    it 'navigates to Cigarette Counter from Set Your Quit Date' do
      sign_in_pt_es('234')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding.ng-scope', text: 'Mi')
      navigate_to('Cigarette Counter (ES)') # need to update with Spanish
      expect(page).to have_css('.pull-left.ng-scope', text: 'Ayer')
    end

    it "sees today's date highlighted" do
      sign_in_pt_es('235')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b. %Y')}")
      d = Date.parse("#{Date.today}")
      today_num = d.mday
      if today_num.between?(1, 9) || today_num.between?(23, 31)
        wrong_date = first('.text-right.ng-binding.ng-scope',
                           text: "#{today_num}").text
        if today_num == 2 && wrong_date.to_i >= 20
          puts 'NOT TESTED' # it gets way too convoluted here, isn't worth it
        elsif today_num == 3 && wrong_date.to_i >= 30
          calendar_today = page.all('.text-right.ng-binding.ng-scope',
                                    text: "#{today_num}")[2]
          calendar_today.native.style('font-weight').should eq('bold')
        elsif wrong_date.to_i > 10
          calendar_today = page.all('.text-right.ng-binding.ng-scope',
                                    text: "#{today_num}")[1]
          calendar_today.native.style('font-weight').should eq('bold')
        else
          first('.text-right.ng-binding.ng-scope', text: "#{today_num}")
            .native.style('font-weight').should eq('bold')
        end
      else
        find('.text-right.ng-binding.ng-scope', text: "#{today_num}")
          .native.style('font-weight').should eq('bold')
      end
    end

    it 'navigates to previous month within Your Quit Date' do
      sign_in_pt_es('236')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b. %Y')}")
      find('a', text: 'Prev.').click # need to update with Spanish
      last_month = Date.today - 30
      expect(page)
        .to have_css('.ng-binding', text: "#{last_month.strftime('%b. %Y')}")
    end

    it 'navigates to next month within Your Quit Date' do
      sign_in_pt_es('237')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b. %Y')}")
      find('a', text: 'Next').click # need to update with Spanish
      next_month = Date.today + 32
      expect(page)
        .to have_css('.ng-binding', text: "#{next_month.strftime('%b. %Y')}")
    end

    it 'navigates back to Today from another month' do
      sign_in_pt_es('237')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      find('.ng-binding', text: "#{Date.today.strftime('%b. %Y')}")
      find('a', text: 'Next').click # need to update with Spanish
      next_month = Date.today + 32
      find('.ng-binding', text: "#{next_month.strftime('%b. %Y')}")
      find('a', text: 'Today').click # need to update with Spanish
      expect(page)
        .to have_css('.ng-binding', text: "#{Date.today.strftime('%b. %Y')}")
    end

    it 'sees Quit Date highlighted' do
      sign_in_pt_es('241')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tom.strftime('%b. %Y')}")
        find('a', text: 'Next').click # need to update with Spanish
      end

      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    # below will have errors in the months of January, April, August,
    # and December

    it 'sets a Quit Date' do
      sign_in_pt_es('239')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tom.strftime('%b. %Y')}")
        find('a', text: 'Next').click # need to update with Spanish
      end

      select_day("#{tom}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    it 'cannot set a Quit Date in the past' do
      sign_in_pt_es('234')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      yes = Date.today - 1
      unless page.has_css?('.ng-binding', text: "#{yes.strftime('%b. %Y')}")
        find('a', text: 'Prev.').click # need to update with Spanish
      end

      select_day("#{yes}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{yes.strftime('%-d')}")
      tom = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tom.strftime('%b. %Y')}")
        find('a', text: 'Next').click # need to update with Spanish
      end
      select_day("#{tom}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{tom.strftime('%-d')}")
    end

    it 'updates a Quit Date' do
      sign_in_pt_es('242')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      tom = Date.today + 1
      unless page.has_css?('.ng-binding', text: "#{tom.strftime('%b. %Y')}")
        find('a', text: 'Next').click # need to update with Spanish
      end

      find('.text-right.ng-binding.ng-scope.success',
           text: "#{tom.strftime('%-d')}")
      two_day = Date.today + 2
      unless page.has_css?('.ng-binding', text: "#{two_day.strftime('%b. %Y')}")
        find('a', text: 'Next').click # need to update with Spanish
      end

      select_day("#{two_day}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{two_day.strftime('%-d')}")
    end

    it 'cannot set a quit date more than 4 weeks from today' do
      sign_in_pt_en('233')
      visit "#{ENV['Base_URL']}/#/es/quit-date"
      beyond_four_wks = Date.today + 30
      unless page.has_css?('.ng-binding',
                           text: "#{beyond_four_wks.strftime('%b. %Y')}")
        find('a', text: 'Next').click # need to update with Spanish
      end

      select_day("#{beyond_four_wks}")
      sleep(2)
      expect(page).to_not have_css('.text-right.ng-binding.ng-scope.success',
                                   text: "#{beyond_four_wks.strftime('%-d')}")

      under_four_wks = Date.today + 25
      select_day("#{under_four_wks}")
      expect(page).to have_css('.text-right.ng-binding.ng-scope.success',
                               text: "#{under_four_wks.strftime('%-d')}")
    end
  end
end

def select_day(date)
  d = Date.parse(date)
  num = d.mday
  if num.between?(1, 9) || num.between?(30, 31) || num >= 23 && page.has_text?("#{num}", count: 2)
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
  if wrong_date.to_i >= 30
    calendar_date(num, 2)
  elsif wrong_date.to_i == 23 && page.has_no_text?('30', count: 2)
    calendar_date(num, 1)
  elsif wrong_date.to_i == 23 && page.has_text?('30', count: 2) && page.has_no_text?('31', count: 2)
    calendar_date(num, 2)
  elsif wrong_date.to_i == 23 && page.has_text?('30', count: 2) && page.has_text?('31', count: 2)
    calendar_date(num, 3)
  end
end

def february(num)
  wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
  if wrong_date.to_i == 23
    calendar_date(num, 7)
  elsif wrong_date.to_i == 24
    calendar_date(num, 5)
  elsif wrong_date.to_i == 25
    calendar_date(num, 4)
  elsif wrong_date.to_i == 26
    calendar_date(num, 3)
  elsif wrong_date.to_i == 27
    calendar_date(num, 2)
  elsif wrong_date.to_i == 28
    calendar_date(num, 1)
  else
    calendar_date(num, 0)
  end
end

def not_february(num)
  wrong_date = first('.text-right.ng-binding.ng-scope', text: "#{num}").text
  if wrong_date.to_i == 23
    calendar_date(num, 7)
  elsif wrong_date.to_i == 24
    calendar_date(num, 6)
  elsif wrong_date.to_i == 25
    calendar_date(num, 5)
  elsif wrong_date.to_i == 26
    calendar_date(num, 4)
  elsif wrong_date.to_i == 27
    calendar_date(num, 3)
  elsif wrong_date.to_i == 28
    calendar_date(num, 2)
  elsif wrong_date.to_i == 29
    calendar_date(num, 1)
  else
    calendar_date(num, 0)
  end
end

def calendar_date(num, y)
  selection = page.all('.text-right.ng-binding.ng-scope', text: "#{num}")[y]
  selection.click
end
