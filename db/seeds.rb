
require 'faker'

#Users
username1 = Faker::Name.name
email1 = Faker::Internet.email(username1)

username2 = Faker::Name.name
email2 = Faker::Internet.email(username2)

username3 = Faker::Name.name
email3 = Faker::Internet.email(username3)

username4 = Faker::Name.name
email4 = Faker::Internet.email(username4)

username5 = Faker::Name.name
email5 = Faker::Internet.email(username5)

user1 = User.create!(username: username1, email: email1, password: Faker::Internet.password)
user2 = User.create!(username: username2, email: email2, password: Faker::Internet.password)
user3 = User.create!(username: username3, email: email3, password: Faker::Internet.password)
user4 = User.create!(username: username4, email: email4, password: Faker::Internet.password)
user5 = User.create!(username: username5, email: email5, password: Faker::Internet.password)

#Questions from User


