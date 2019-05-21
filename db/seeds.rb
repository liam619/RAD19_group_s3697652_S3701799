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

rad = Course.new(name: 'Rapid Application Development', user_id: 1, description: 'This is sample Rapid Application Development for RMIT university')
capstone = Course.new(name: 'Capstone Project', user_id: 1, description: 'This is sample Capstone Project for RMIT university')
webPro = Course.new(name: 'Web Programming', user_id: 1, description: 'This is sample Web Programming for RMIT university')
advPro = Course.new(name: 'Advance Programming', user_id: 1, description: 'This is sample Advance Programming for RMIT university')
ios = Course.new(name: 'Advanced iOS/OSX Programming', user_id: 1, description: 'This is sample Advanced iOS/OSX Programming for RMIT university')
exp3year = Course.new(name: '3 years iOS or relevant experience', user_id: 1, description: 'This is sample industrial requirement for RMIT university')

webDev = Category.create!(name: 'Web Development')
fullStackDev = Category.create!(name: 'Full Stack Dev')
iosEng = Category.create!(name: 'iOS Engineering')
indExp = Category.create!(name: "Industrial Experience")

preq1 = Prerequisite.create!(id: webPro.id)
preq2 = Prerequisite.create!(id: advPro.id)
preq3 = Prerequisite.create!(id: exp3year.id)

rad.categories << webDev
capstone.categories << fullStackDev
ios.categories << iosEng
webPro.categories << webDev
advPro.categories << fullStackDev
exp3year.categories << indExp

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
exp3year.locations << location1
webPro.locations << location2
advPro.locations << location3

rad.save
capstone.save
webPro.save
advPro.save
ios.save
exp3year.save