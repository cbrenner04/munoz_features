# frozen_string_literal: true
# Expected headers for consent_responses.csv compared to actual in csv_spec.rb
module ConsentResponses
  HEADER = ['Id', 'Responded at', 'Is consented', 'Uuid', 'Created at',
            'Updated at', 'Id [Participant]', 'Email [Participant]',
            'Reset password sent at [Participant]',
            'Remember created at [Participant]', 'Sign in count [Participant]',
            'Current sign in at [Participant]', 'Last sign in at [Participant]',
            'Current sign in ip [Participant]', 'Last sign in ip [Participant]',
            'Confirmation token [Participant]', 'Confirmed at [Participant]',
            'Confirmation sent at [Participant]',
            'Unconfirmed email [Participant]', 'Failed attempts [Participant]',
            'Unlock token [Participant]', 'Locked at [Participant]',
            'Created at [Participant]', 'Updated at [Participant]',
            'Uuid [Participant]', 'Provider [Participant]',
            'Uid [Participant]', 'Id [Consent form]', 'Version [Consent form]',
            'Uuid [Consent form]', 'Language [Consent form]',
            'Body [Consent form]', 'Consent label [Consent form]',
            'Non consent label [Consent form]', 'Footer [Consent form]',
            'Created at [Consent form]', 'Updated at [Consent form]',
            'Header [Consent form]'].freeze
end
