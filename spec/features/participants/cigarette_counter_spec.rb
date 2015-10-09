# filename: spec/features/participants/cigarette_counter.rb

describe 'A registered and consented participant signs in', type: :feature do
  context 'in English' do
    it 'accesses the cigarette counter' do
      sign_in_pt_en(ENV['Pt_113_Email'], ENV['Pt_113_Password'])
      click_on 'Cigarette Counter'
      expect(page).to have_content 'Yesterday'
      expect(page).to have_css '.btn-group-vertical'
    end

    it "sees yesterday's cigarette count" do
      sign_in_pt_en(ENV['Pt_17_Email'], ENV['Pt_17_Password'])
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Yesterday') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/en/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Yesterday') do
        expect(page).to have_content '15'
      end
    end

    it "increments yesterday's cigarette count" do
      sign_in_pt_en(ENV['Pt_18_Email'], ENV['Pt_18_Password'])
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Yesterday') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/en/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Yesterday') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '+').click
        expect(page).to have_content '16'
      end
    end

    it "decrements yesterday's cigarette count" do
      sign_in_pt_en(ENV['Pt_19_Email'], ENV['Pt_19_Password'])
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Yesterday') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/en/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Yesterday') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '-').click
        expect(page).to have_content '14'
      end
    end

    it "sees today's cigarette count" do
      sign_in_pt_en(ENV['Pt_114_Email'], ENV['Pt_114_Password'])
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Today') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/en/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Today') do
        expect(page).to have_content '15'
      end
    end

    it "increments today's cigarette count" do
      sign_in_pt_en(ENV['Pt_115_Email'], ENV['Pt_115_Password'])
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Today') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/en/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Today') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '+').click
        expect(page).to have_content '16'
      end
    end

    it "decrements today's cigarette count" do
      sign_in_pt_en(ENV['Pt_116_Email'], ENV['Pt_116_Password'])
      visit "#{ENV['Base_URL']}/#/en/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Today') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/en/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Today') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '-').click
        expect(page).to have_content '14'
      end
    end
  end

  context 'in Español' do
    it 'access the cigarette counter' do
      sign_in_pt_es(ENV['Pt_213_Email'], ENV['Pt_213_Password'])
      click_on 'Cigarette Counter' # need to update with Spanish
      expect(page).to have_content 'Ayer'
      expect(page).to have_css '.btn-group-vertical'
    end

    it "sees yesterday's cigarette count" do
      sign_in_pt_en(ENV['Pt_20_Email'], ENV['Pt_20_Password'])
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Ayer') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/es/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Ayer') do
        expect(page).to have_content '15'
      end
    end

    it "increments yesterday's cigarette count" do
      sign_in_pt_en(ENV['Pt_21_Email'], ENV['Pt_21_Password'])
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Ayer') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/es/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Ayer') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '+').click
        expect(page).to have_content '16'
      end
    end

    it "decrements yesterday's cigarette count" do
      sign_in_pt_en(ENV['Pt_22_Email'], ENV['Pt_22_Password'])
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Ayer') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/es/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Ayer') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '-').click
        expect(page).to have_content '14'
      end
    end

    it "sees today's cigarette count" do
      sign_in_pt_en(ENV['Pt_214_Email'], ENV['Pt_214_Password'])
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Hoy') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/es/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Hoy') do
        expect(page).to have_content '15'
      end
    end

    it "increments today's cigarette count" do
      sign_in_pt_en(ENV['Pt_215_Email'], ENV['Pt_215_Password'])
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Hoy') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/es/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Hoy') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '+').click
        expect(page).to have_content '16'
      end
    end

    it "decrements today's cigarette count" do
      sign_in_pt_en(ENV['Pt_216_Email'], ENV['Pt_216_Password'])
      visit "#{ENV['Base_URL']}/#/es/cigarette-count"
      find('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Hoy') # remove when navigation fixed
      visit "#{ENV['Base_URL']}/#/es/cigarette-count" # remove when navigation fixed
      within('.col-xs-6.col-sm-4.col-md-2.ng-scope', text: 'Hoy') do
        find('.lead.ng-binding', text: '15')
        find('.btn.btn-lg.btn-default', text: '-').click
        expect(page).to have_content '14'
      end
    end
  end
end
