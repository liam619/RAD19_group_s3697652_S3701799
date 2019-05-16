# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "William Low",
             email: "william.low@rmit.edu.au",
             password: "@123Qwerty",
             password_confirmation: "@123Qwerty")

rad = Course.create!(name: 'Rapid Application Development', user_id: 1, description: 'This is sample')
capstone = Course.create!(name: 'Capstone Project', user_id: 1, description: 'This is sample')
webPro = Course.create!(name: 'Web Programming', user_id: 1, description: 'This is sample')
advPro = Course.create!(name: 'Advance Programming', user_id: 1, description: 'This is sample')
ios = Course.create!(name: 'Advanced iOS/OSX Programming', user_id: 1, description: 'This is sample')
exp3year = Course.create!(name: '3 years iOS or relevant experience', user_id: 1, description: 'This is sample')

webDev = Category.create!(name: 'Web Development')
fullStackDev = Category.create!(name: 'Full Stack Dev')
iosEng = Category.create!(name: 'iOS Engineering')

preq1 = Prerequisite.create!(id: webDev.id)
preq2 = Prerequisite.create!(id: advPro.id)
preq3 = Prerequisite.create!(id: exp3year.id)

rad.categories << webDev
capstone.categories << fullStackDev
ios.categories << iosEng

rad.prerequisites << preq1
capstone.prerequisites << preq2
ios.prerequisites << preq3

location1 = Location.create!(name: '14.10.31')
location2 = Location.create!(name: '14.08.26')
location3 = Location.create!(name: '14.10.31')
location4 = Location.create!(name: '14.10.30')

rad.locations << location1
rad.locations << location2
capstone.locations << location3
ios.locations << location4
