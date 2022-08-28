# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
start_hour = Time.now.hour + 1
start_time = (start_hour.to_s + ":00").to_time
interval = 30.minutes
(0...48*7).each do |i|
  TimeTable.create!({start_time:start_time+interval*i})
end
Tutor.create!([
                {email: "harimkim93@likelion.org", password: "a123123", password_confirmation:"a123123"},
                {email: "yongkal2@yonsei.ac.kr", password: "a123123", password_confirmation:"a123123"} ,
                {email: "yongkal3@nate.com", password: "a123123", password_confirmation:"a123123"}
              ])
Student.create!([
                {email: "harimkim93@likelion.org", password: "a123123", password_confirmation:"a123123"},
                {email: "yongkal2@yonsei.ac.kr", password: "a123123", password_confirmation:"a123123"} ,
                {email: "yongkal3@nate.com", password: "a123123", password_confirmation:"a123123"}
              ])
