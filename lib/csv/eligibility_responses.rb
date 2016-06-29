# Expected headers for eligibility_responses.csv compared to actual in
# csv_spec.rb.
module EligibilityResponses
  HEADER = ['Responded at', 'Coded response value', 'Id [Participant]',
            'Email [Participant]', 'Reset password sent at [Participant]',
            'Remember created at [Participant]', 'Sign in count [Participant]',
            'Current sign in at [Participant]', 'Last sign in at [Participant]',
            'Current sign in ip [Participant]', 'Last sign in ip [Participant]',
            'Confirmation token [Participant]', 'Confirmed at [Participant]',
            'Confirmation sent at [Participant]',
            'Unconfirmed email [Participant]', 'Failed attempts [Participant]',
            'Unlock token [Participant]', 'Locked at [Participant]',
            'Created at [Participant]', 'Updated at [Participant]',
            'Uuid [Participant]', 'Value [Answer]', 'Label [Answer]',
            'Position [Answer]', 'Code [Question]', 'Language [Question]',
            'Answer type [Question]', 'Body [Question]', 'Position [Question]',
            'Required [Question]', 'Help [Question]'].freeze
end
