# Expected headers for sms_records.csv compared to actual in csv_spec.rb.
module SmsRecords
  HEADER = ['Id', 'Resource path', 'Created at', 'Updated at',
            'Id [Participant phone]', 'Phone number [Participant phone]',
            'Confirmation token [Participant phone]',
            'Confirmed at [Participant phone]',
            'Confirmation sent at [Participant phone]',
            'Uuid [Participant phone]', 'Country code [Participant phone]',
            'Mobile network code [Participant phone]',
            'Carrier name [Participant phone]',
            'Phone number type [Participant phone]',
            'Phone number validation status [Participant phone]',
            'Phone number lookup errors [Participant phone]',
            'Created at [Participant phone]', 'Updated at [Participant phone]']
end
