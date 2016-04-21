
require 'faker'
require 'pry'
# 5 users
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


# 2-4 questions from each user

# generates random array of four words
# each word in array is capitalised
# Each index inside of the array is combine with space between each word

def extract_user_ids
  User.all.map do |user|
    user.id
  end
end

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


# 2-4 comments on other users' questions from each user

def create_comment
  Faker::Lorem.sentences
end

def other_users_id(your_id, all_users)
  answer = rand(all_users.length) + 1
  if answer == your_id
    other_users_id(your_id, all_users)
  else
    return answer
  end
end

def extract_question_ids
  Question.all.map do |ques|
    ques.id
  end
end


def generate_comments_for_each_question_from_user(num_of_comments, questions)

  num_of_comments.times do

    questions.each do |id|
      Comment.create!(content: create_comment, user_id: other_users_id(rand(1..5), extract_user_ids), commentable_id: other_users_id(id, Question.all), commentable_type: Question)
    end
  end
end

generate_comments_for_each_question_from_user(rand_num, extract_question_ids)

# 2-4 answers on other users' questions from each user



def create_answer
  Faker::Lorem.sentence(3)
end

def generate_answers_for_other_user(num_of_answers, questions, users)

  num_of_answers.times do

    questions.each do |q_id|

      users.each do |u_id|
        Answer.create!(content: create_answer, question_id: q_id, user_id: other_users_id(u_id, User.all), best_answer: false)
      end
    end
  end
end

generate_answers_for_other_user(rand_num, extract_question_ids, extract_user_ids)

# 2-4 comments on other users' answers from each user

def extract_answer_ids
  Answer.all.map do |ans|
    ans.id
  end
end

def generate_comments_for_each_answer_from_user(num_of_comments, answers)

  num_of_comments.times do

    answers.each do |id|
      Comment.create!(content: create_comment, user_id: rand(1..5), commentable_id: other_users_id(id, Answer.all), commentable_type: Answer)
    end
  end
end

generate_comments_for_each_answer_from_user(rand_num, extract_answer_ids)
