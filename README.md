# README

This README file contains information of the project under ## Project Information and how to start the project under ## Getting Started. 
At the end of this file contains directories to heroku logs under ## Heroku logs and toggl summary report under ## Toggl report.

## Project Information

TEAM MEMBERS: 
S3697652 (William Low) & S3701799 (Syed Hariz)

Highest Level attempted: 
90+

Heroku URL: 
https://sheltered-scrubland-60869.herokuapp.com/

Ruby version
  ruby 2.6.0p0 (2018-12-25 revision 66547)

Rails version 
  Rails 5.1.6

Database version
  sqlite3-1.3.13
  
  
## Getting Started

To get started with the app, clone the repo and then install the needed gems:

  Installing gems command: $ bundle install --without production

Next, migrate the database: 

  Migrate database command: $ rails db:migrate
  
  After that, populate the database with information: $ rails db:seed

  Once database is migrated and information is populated, check the database as follows: 
  1) Go to this directory as follows:
        RAD19_group_s3697652_s3701799/app/db/development.sqlite3
  2) Right click on the file and click 'Download'
  3) Open your SQLiteStudio and import the downloaded database

Finally, run the test suite to verify that everything is working correctly:

  Running tests command: $ rails test
  
  After running the test, you will get this expected output: 58 tests, 76 assertions, 6 failures, 0 errors, 0 skips
  DO NOT worry about the fail tests, the project is still working as per requirement. Fail tests returns expected response
  to be either 302: Found or 202: OK
  
After running the test suites, you'll be ready to run the app in a local server:

  Running the app in local server command: $ rails server
  
Logging in the app: 

  Information to log in the app can be found in this directory: /RAD19_group_s3697652_S3701799/db/seeds.rb
  
  Admin
  Email: admin
  Password: password
  
  User 1
  Email: william.low@rmit.edu.au
  Password: @123Qwerty
  
  User2
  Email: syed.hariz@rmit.edu.au
  Password: Pass123!
    
ENJOY THE APP!

## Heroku logs

Heroku log can be found under file name: HEROKU-LOGS.md
Directory to HEROKU-LOGS: /RAD19_group_s3697652_S3701799/HEROKU-LOGS.md

## Toggl report

Toggl report by both team members can be viewed under: TOGGL-REPORT.pdf
Directory to TOGGL-REPORT: /RAD19_group_s3697652_S3701799/TOGGL-REPORT.pdf

Toggl detailed time entries by both team members can be viewed under: TOGGL-TIME-ENTRIES.pdf
Directory to TOGGL-TIME-ENTRIES: /RAD19_group_s3697652_S3701799/TOGGL-TIME-ENTRIES.pdf