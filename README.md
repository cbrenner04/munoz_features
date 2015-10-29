# Muñoz Selenium Test Suite

This is a test suite meant for testing the
[Aim2Quit SF app](https://github.com/NU-CBITS/munoz)

## Information for running this test suite

You will need to set up participants and users in the app. If you are
running the app locally you can seed this data by running from the test suite
directory on the command line:

    rake load_app_local

Otherwise you will need to set up the following in the app:

* Participants 101 - 148, 201 - 248, 3 - 30
* Users 1 - 4
* Participants 3 and 4 confirmation tokens for email
* Participants 29 and 30 confirmation tokens for phone numbers

See
[Fixtures](https://github.com/NU-CBITS/munoz/tree/master/spec/selenium_fixtures)
for details about what data each of these participants and users will need.

You will then need a file called `env_variables.rb`, which is required in the
`.rspec` file, that houses the following environment variables. These
correspond with the above participants and users seeded in the app.

For each of the participants listed above you will need
`Pt_<participant_number>_Email`, `Pt_<participant_number>_Password`, and
`Pt_<participant_number>_Phone_Number`. For example, the data in the app for
participant101 will correspond, in your `env_variables.rb` file, with:

    Pt_101_Email
    Pt_101_Password
    Pt_101_Phone_Number

For each of the users listed above you will need
`User_<user_number>_Email` and `User_<user_number>_Password`. For example,
the data in the app for user1 will correspond with:

    User_1_Email
    User_1_Password

You will also need the following environment variables:

    Pt_3_Confirmation
    Pt_4_Confirmation
    Pt_29_Confirmation
    Pt_30_Confirmation

Once you have the data seeded in the app and the `env_variables.rb` file
configured, from the test suite directory on the command line you can simply
run:

    rspec
