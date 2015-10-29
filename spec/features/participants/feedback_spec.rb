# filename: spec/features/participants/feedback_spec.rb

describe 'An eligible participant', type: :feature, metadata: :participant do
  context 'in English' do
    it 'signs in, navigates to the feedback page' do
      sign_in_pt_en('146')
      navigate_to('Feedback')
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 5)
    end

    it 'signs in, rates the application' do
      sign_in_pt_en('147')
      visit "#{ENV['Base_URL']}/#/en/feedback"
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 5)
      page.all('.glyphicon.glyphicon-star-empty')[3].click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 1)
    end

    it 'checks already entered rating' do
      sign_in_pt_en('148')
      visit "#{ENV['Base_URL']}/#/en/feedback"
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 1)
    end
  end

  context 'in Español' do
    it 'signs in, navigates to the feedback page' do
      sign_in_pt_es('246')
      navigate_to('Feedback')
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 5)
    end

    it 'signs in, rates the application' do
      sign_in_pt_es('247')
      visit "#{ENV['Base_URL']}/#/es/feedback"
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 5)
      page.all('.glyphicon.glyphicon-star-empty')[3].click
      find('.btn.btn-primary', text: 'Submit').click
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 1)
    end

    it 'checks already entered rating' do
      sign_in_pt_en('248')
      visit "#{ENV['Base_URL']}/#/en/feedback"
      expect(page).to have_css('.glyphicon.glyphicon-star-empty', count: 1)
    end
  end
end
