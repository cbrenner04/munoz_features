# Muñoz Selenium Test Suite

This is a test suite meant for testing the
[Aim2Quit SF app](https://github.com/NU-CBITS/munoz)

## Information for running this test suite

You will need to set up participants and users in the app. If you are
running the app locally you can seed this data and start the application
by running from the test suite directory on the command line:

    rake load_app_local

Otherwise you will need to set up the following in the app:

* Participants 3 - 8, 17 - 22, 25, 26, 29 - 30, 105 - 151, 205 - 251
* Users 1 - 4

See
[Fixtures](https://github.com/NU-CBITS/munoz/tree/master/spec/selenium_fixtures)
for details about what data each of these participants and users will need.

You will then need a file called `env_variables.rb`, which is required in the
`.rspec` file, that houses the following environment variables. These
correspond with the data for the above participants and users seeded in the app.

For each of the participants (numbers: 3 - 50, 101 - 156, 201 - 256) you will
need `Pt_<participant_number>_Email`, `Pt_<participant_number>_Password`, and
`Pt_<participant_number>_Phone_Number`. For example, the data in the app for
participant101 will correspond, in your `env_variables.rb` file, with:

    ENV['Pt_101_Email'] ||= "yourparticipantemail@example.com"
    ENV['Pt_101_Password'] ||= "your super secret password"
    ENV['Pt_101_Phone_Number'] ||= "555-555-5555"

For each of the users (numbers: 1 - 4) you will need
`User_<user_number>_Email` and `User_<user_number>_Password`. For example,
the data in the app for user1 will correspond with:

    ENV['User_1_Email'] ||= "youruseremail@example.com"
    ENV['User_1_Password'] ||= "your super secret password"

You will also need the following environment variables:

    ENV['Base_URL'] ||= "localhost:3000"
    ENV['Pt_3_Confirmation'] ||= "ConFirMATionTOKen"
    ENV['Pt_4_Confirmation'] ||= "cONF1rmat10NtoKen"
    ENV['Pt_29_Confirmation'] ||= "toKEN"
    ENV['Pt_30_Confirmation'] ||= "T0k3N"

*Important:* If you are running this test suite against the app locally, you
will need to run a redis server. For redis documentation go
[here](http://redis.io/documentation). Additionally, as of 11/18/2015, the host
app communicates with a real Twilio account while in the `development`
environment. Therefore, if you are running this suite locally, you will need to
change `config.from_sms_number` in `./config/environments/development.rb` to a
real Twilio number. You will also need to set the following environment
variables that reference the Twilio account: `TWILIO_ACCOUNT_SID`,
`TWILIO_PHONE_NUMBER`, and `TWILIO_AUTH_TOKEN`.

Once you have the data seeded in the app, the `env_variables.rb` file
configured, and the redis server running, start the app and from the test suite
directory on the command line you can simply run:

    rspec
