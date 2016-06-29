# Expected headers for page_view.csv compared to actual in csv_spec.rb.
module PageView
  HEADER = ['Id', 'Occurred at', 'Viewport width', 'Viewport height',
            'User agent', 'Language', 'Url', 'Created at', 'Updated at',
            'Id [Participant]', 'Email [Participant]',
            'Reset password sent at [Participant]',
            'Remember created at [Participant]', 'Sign in count [Participant]',
            'Current sign in at [Participant]',
            'Last sign in at [Participant]', 'Current sign in ip [Participant]',
            'Last sign in ip [Participant]', 'Confirmation token [Participant]',
            'Confirmed at [Participant]', 'Confirmation sent at [Participant]',
            'Unconfirmed email [Participant]', 'Failed attempts [Participant]',
            'Unlock token [Participant]', 'Locked at [Participant]',
            'Created at [Participant]', 'Updated at [Participant]',
            'Uuid [Participant]'].freeze
end
