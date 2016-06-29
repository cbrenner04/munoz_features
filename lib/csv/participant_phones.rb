# Expected headers for participant_phones.csv compared to actual in csv_spec.rb
module ParticipantPhones
  HEADER = ['Id', 'Phone number', 'Confirmation token', 'Confirmed at',
            'Confirmation sent at', 'Uuid', 'Country code',
            'Mobile network code', 'Carrier name', 'Phone number type',
            'Phone number validation status', 'Phone number lookup errors',
            'Created at', 'Updated at', 'Id [Participant]',
            'Email [Participant]', 'Reset password sent at [Participant]',
            'Remember created at [Participant]', 'Sign in count [Participant]',
            'Current sign in at [Participant]', 'Last sign in at [Participant]',
            'Current sign in ip [Participant]', 'Last sign in ip [Participant]',
            'Confirmation token [Participant]', 'Confirmed at [Participant]',
            'Confirmation sent at [Participant]',
            'Unconfirmed email [Participant]', 'Failed attempts [Participant]',
            'Unlock token [Participant]', 'Locked at [Participant]',
            'Created at [Participant]', 'Updated at [Participant]',
            'Uuid [Participant]', 'Id [Sms records]',
            'Resource path [Sms records]', 'Created at [Sms records]',
            'Updated at [Sms records]'].freeze
end
