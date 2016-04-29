# filename: spec/features/participants/login_spec.rb

require './spec/support/participants/login_helper'
require './spec/support/participants_helper'
require './spec/support/users_helper'

feature 'A visitor to the site', metadata: :participant do
  before do
    participant_generic.go_to_root
  end

  context 'is English speaking' do
    scenario 'is a registered participant and signs in' do
      participant_112.sign_in

      expect(login_eng).to have_home_visible
    end

    scenario 'is not a registered participant, cannot sign in' do
      participant_fake.sign_in

      expect(login_eng).to be_sign_in_unsuccessful
    end

    scenario 'is a registered participant and request password reset' do
      login_eng.click_sign_in
      login_eng.find_sign_in
      login_eng.click_forgot_pw
      participant_110.fill_in_ptp_email
      login_eng.click_send_pw_instructions

      expect(login_eng).to have_pw_reset_confirm_message
    end

    scenario "uses 'Didn't receive confirmation instructions?'" do
      login_eng.click_sign_in
      login_eng.find_sign_in
      login_eng.click_did_not_receive_confirm_instructions

      expect(login_eng).to have_resend_confirm_instructions

      participant_5.fill_in_ptp_email
      login_eng.click_resend_confirm_instructions

      expect(login_eng).to have_email_confirm_message
    end

    scenario 'is a registered participant who locks their account' do
      login_eng.click_sign_in
      login_eng.find_sign_in
      18.times do
        participant_105.fill_in_ptp_email
        participant_fake.fill_in_ptp_password
        login_eng.click_sign_in

        expect(login_eng).to have_invalid_email_pw
      end

      participant_105.fill_in_ptp_email
      participant_fake.fill_in_ptp_password
      login_eng.click_sign_in

      expect(login_eng).to have_lock_warning

      participant_105.fill_in_ptp_email
      participant_fake.fill_in_ptp_password
      login_eng.click_sign_in

      expect(login_eng).to have_account_locked
    end

    scenario "uses 'Didn't receive unlock instructions?'" do
      login_eng.click_sign_in
      login_eng.find_sign_in
      login_eng.click_did_not_receive_unlock_instructions

      expect(login_eng).to have_resend_unlock_instructions

      participant_6.fill_in_ptp_email
      login_eng.click_resend_unlock_instructions

      expect(login_eng).to have_resend_unlock_message
    end

    scenario 'signs in, signs out' do
      participant_111.sign_in
      login_eng.click_navbar
      login_eng.click_dropdown
      login_eng.click_sign_out

      expect(login_eng).to have_login_page_visible
    end

    scenario 'signs in, visits Google, returns to app, sees correct home page' do
      participant_111.sign_in

      expect(login_eng).to have_stop_smoking_guide

      login_eng.visit_google

      expect(login_eng).to have_google_content

      participant_111.go_to_root

      expect(login_eng).to have_home_visible
    end

    scenario 'signs in, navigates to another page, uses brand link, ' \
       'sees correct home' do
      participant_111.sign_in
      login_eng.click_stop_smoking_guide

      expect(login_eng).to have_stop_smoking_guide_head

      login_eng.click_navbar_brand

      expect(login_eng).to have_cig_counter_link
    end

    scenario 'signs in, goes to a tool, navigates home using brand link' do
      participant_111.sign_in
      visit cigarette_counter_eng.landing_page
      login_eng.click_home_icon

      expect(login_eng).to have_home_visible
    end

    scenario 'signs in, goes to a tool, navigates home using Home link' do
      participant_111.sign_in
      visit cigarette_counter_eng.landing_page
      login_eng.click_navbar
      login_eng.click_home_btn

      expect(login_eng).to have_home_visible

      participant_111.go_to('Sign out')
    end
  end

  # Spanish

  context 'is Spanish speaking' do
    scenario 'is a registered participant and signs in in Español' do
      participant_212.sign_in

      expect(login_esp).to have_home_visible
    end

    scenario 'is not a registered participant, cannot sign in' do
      participant_fake.sign_in

      expect(login_eng).to be_sign_in_unsuccessful
    end

    # Manual testing shows no resend confirmation message. Not sure how the English version is running.

    scenario 'is a registered participant and requests password reset' do
      login_esp.click_sign_in
      login_esp.find_sign_in
      login_esp.click_forgot_pw
      participant_210.fill_in_ptp_email
      login_esp.click_send_pw_instructions

      expect(login_esp).to have_pw_reset_confirm_message
    end

    scenario "uses 'Didn't receive confirmation instructions?'" do
      login_esp.click_sign_in
      login_esp.find_sign_in
      login_esp.click_did_not_receive_confirm_instructions

      expect(login_esp).to have_resend_confirm_instructions

      participant_8.fill_in_ptp_email
      login_esp.click_resend_confirm_instructions

      expect(login_esp).to have_email_confirm_message
    end

    scenario 'is a registered participant who locks their account' do
      login_esp.click_sign_in
      login_esp.find_sign_in
      18.times do
        participant_205.fill_in_ptp_email
        participant_fake.fill_in_ptp_password
        login_esp.click_sign_in

        expect(login_esp).to have_invalid_email_pw
      end

      participant_205.fill_in_ptp_email
      participant_fake.fill_in_ptp_password
      login_esp.click_sign_in

      expect(login_esp).to have_lock_warning

      participant_205.fill_in_ptp_email
      participant_fake.fill_in_ptp_password
      login_esp.click_sign_in

      expect(login_esp).to have_account_locked
    end

    scenario "uses 'Didn't receive unlock instructions?'" do
      login_esp.click_sign_in
      login_esp.find_sign_in
      login_esp.click_did_not_receive_unlock_instructions

      expect(login_esp).to have_resend_unlock_instructions

      participant_7.fill_in_ptp_email
      login_esp.click_resend_unlock_instructions

      expect(login_esp).to have_resend_unlock_message
    end

    scenario 'signs in, signs out' do
      participant_211.sign_in
      login_esp.click_navbar
      login_esp.click_dropdown
      login_esp.click_sign_out
      sleep(2)

      expect(login_esp).to have_login_page_visible
    end

    scenario 'signs in, visits Google, returns to app, sees correct home page' do
      participant_211.sign_in

      expect(login_esp).to have_stop_smoking_guide

      login_esp.visit_google

      expect(login_esp).to have_google_content

      participant_211.go_to_root

      expect(login_esp).to have_home_visible
    end

    scenario 'signs in, navigates to another page, uses brand link, ' \
       'sees correct home' do
      participant_211.sign_in
      login_esp.click_stop_smoking_guide

      expect(login_esp).to have_stop_smoking_guide_head

      login_esp.click_navbar_brand

      expect(login_esp).to have_cig_counter_link
    end

    scenario 'signs in, goes to a tool, navigates home using brand link' do
      participant_211.sign_in
      visit cigarette_counter_esp.landing_page
      login_esp.click_home_icon

      expect(login_esp).to have_home_visible
    end

    scenario 'signs in, goes to a tool, navigates home using Home link' do
      participant_211.sign_in
      visit cigarette_counter_esp.landing_page
      login_esp.click_navbar
      login_esp.click_home_btn

      expect(login_esp).to have_home_visible
    end
  end
end

feature 'A visitor to the site', metadata: :participant do
  before do
    participant_generic.go_to_root
  end

  after do
    user_1.resize_to_mobile
  end

  context 'in English' do
    scenario 'confirms phone' do
      visit participant_29.phone_confirmation
      sleep(2)

      expect(login_eng).to have_confirm_message

      participant_29.sign_in

      expect(login_eng).to have_home_visible

      participant_29.go_to('Sign out')

      user_1.sign_in
      user_1.resize_to_desktop
      user_1.click_on_ptp_phones

      login_user_eng.phone_confirm_time
    end
  end

  context 'in Español' do
    scenario 'confirms phone' do
      visit participant_30.phone_confirmation
      sleep(2)

      expect(login_esp).to have_confirm_message

      participant_30.sign_in

      expect(login_esp).to have_home_visible

      participant_30.go_to('Finalizar la sesión')

      user_1.sign_in
      user_1.resize_to_desktop
      user_1.click_on_ptp_phones

      login_user_esp.phone_confirm_time
    end
  end
end

feature 'A visitor to the site', metadata: :participant do
  context 'is English speaking' do
    scenario 'confirms email' do
      visit participant_3.email_confirmation

      expect(login_eng).to have_email_confirmation

      participant_3.fill_in_ptp_email
      participant_3.fill_in_ptp_password
      login_eng.click_sign_in

      expect(login_eng).to have_home_visible
    end
  end

  context 'is Spanish speaking' do
    scenario 'confirms email' do
      visit participant_4.email_confirmation

      expect(login_esp).to have_email_confirmation

      participant_3.fill_in_ptp_email
      participant_3.fill_in_ptp_password
      login_esp.click_sign_in

      expect(login_esp).to have_home_visible
    end
  end
end

feature 'A visitor to the site', metadata: :participant do
  after do
    user_1.resize_to_mobile
  end

  context 'is English speaking' do
    scenario 'gets notifications scheduled' do
      participant_156.sign_in

      expect(login_eng).to have_stop_smoking_guide

      participant_156.go_to('Sign out')

      user_1.sign_in
      user_1.resize_to_desktop
      visit user_1.notification_sched_page
      login_user_eng.reminder_90_days
      login_user_eng.reminder_60_days
      login_user_eng.reminder_30_days
    end
  end

  context 'is Spanish speaking' do
    scenario 'gets notifications scheduled' do
      participant_256.sign_in

      expect(login_esp).to have_stop_smoking_guide

      participant_256.go_to('Finalizar la sesión')

      user_1.sign_in
      user_1.resize_to_desktop
      visit user_1.notification_sched_page
      login_user_esp.reminder_90_days
      login_user_esp.reminder_60_days
      login_user_esp.reminder_30_days
    end
  end
end
