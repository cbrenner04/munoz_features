# filename: spec/features/participants/feedback_spec.rb

describe 'An eligible participant', type: :feature, metadata: :participant do
  context 'in English' do
    it 'signs in, navigates to the feedback page' do
      sign_in_pt_en('146')
      navigate_to('Feedback')
      expect(page).to have_content 'How helpful was this app?'
    end

    it 'signs in, rates the application' do
      sign_in_pt_en('147')
      visit "#{ENV['Base_URL']}/#/en/feedback"
      expect(page)
        .to have_css('.btn.btn-default.ng-binding.ng-scope.active', count: 0)

      page.all('.btn.btn-default')[3].click
      page.all('.btn.btn-default')[17].click
      expect(page)
        .to have_css('.btn.btn-default.ng-binding.ng-scope.active', count: 2)

      within first('.btn.btn-default.ng-binding.ng-scope.active') do
        expect(page).to have_content '3'
      end

      within page.all('.btn.btn-default.ng-binding.ng-scope.active')[1] do
        expect(page).to have_content '6'
      end

      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_content 'Stop Smoking Guide'
    end

    it 'cannot enter rating if one is already entered'
  end

  context 'in Español' do
    it 'signs in, navigates to the feedback page' do
      sign_in_pt_es('246')
      navigate_to('Comentarios')
      expect(page).to have_content '¿Qué tan útil fue esta aplicación?'
    end

    it 'signs in, rates the application' do
      sign_in_pt_en('247')
      visit "#{ENV['Base_URL']}/#/es/feedback"
      expect(page)
        .to have_css('.btn.btn-default.ng-binding.ng-scope.active', count: 0)

      page.all('.btn.btn-default')[3].click
      page.all('.btn.btn-default')[17].click
      expect(page)
        .to have_css('.btn.btn-default.ng-binding.ng-scope.active', count: 2)

      within first('.btn.btn-default.ng-binding.ng-scope.active') do
        expect(page).to have_content '3'
      end

      within page.all('.btn.btn-default.ng-binding.ng-scope.active')[1] do
        expect(page).to have_content '6'
      end

      find('.btn.btn-primary', text: 'Submit').click # need to update with Spanish
      expect(page).to have_content 'Guía Para Dejar de Fumar'
    end

    it 'checks already entered rating'
  end
end
