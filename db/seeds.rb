
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

user1 = User.create!(username: username1, email: email1, password: Faker::Internet.password) #has user_id = 1
user2 = User.create!(username: username2, email: email2, password: Faker::Internet.password) #has user_id = 2
user3 = User.create!(username: username3, email: email3, password: Faker::Internet.password) #has user_id = 3
user4 = User.create!(username: username4, email: email4, password: Faker::Internet.password) #has user_id = 4
user5 = User.create!(username: username5, email: email5, password: Faker::Internet.password) #has user_id = 5


#Questions from User

# generates random array of four words
# each word in array is capitalised
# Each index inside of the array is combine with space between each word

def create_title
  Faker::Lorem.words(4).map!{|word| word.capitalize}.join(' ')
end

def create_content
  Faker::Lorem.paragraph
end

def generate_questions_for_users(num_of_ques, num_of_users)
  num_of_ques.times do
    num_of_users.each do |user|
      Question.create!(title: create_title, content: create_content, user_id: user)
    end
  end
end

def rand_num
  rand(2..4)
end

generate_questions_for_users(rand_num, [1, 2, 3, 4, 5])




