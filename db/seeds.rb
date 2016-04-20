
require 'faker'

#Users
username = Faker::Name.name
password = Faker::Internet.password
email = Faker::Internet.email(username)

user1 = User.create(username: username, email: email, password: password)
user2 = User.create(username: username, email: email, password: password)
user3 = User.create(username: username, email: email, password: password)
user4 = User.create(username: username, email: email, password: password)
user5 = User.create(username: username, email: email, password: password)

