# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([
  { name: 'ruby' },
  { name: 'web' }
])

users = User.create!([
  { email: 'filin-i@yandex.ru', password: '123123', level: 0, type: 'Admin', first_name: 'Ivan', last_name: 'Petrov' },
  { email: 'b@b', password: '123123', level: 2, first_name: 'Ivan', last_name: 'Petrov' }
])

tests = Test.create!([
  { title: 'Ruby test', level: 1, category_id: categories[0].id, user_id: users[0].id },
  { title: 'Web technology', level: 2, category_id: categories[1].id, user_id: users[0].id }
])

questions = Question.create!([
  { title: 'Who create Ruby lang?', test_id: tests[0].id },
  { title: 'What language create Matz?', test_id: tests[0].id }
])

answers = Answer.create!([
  { body: 'Homer Simpson', question_id: questions[0].id, correct: false },
  { body: 'Matz', question_id: questions[0].id, correct: true },
  { body: 'Ruby', question_id: questions[1].id, correct: true },
  { body: 'PHP', question_id: questions[1].id, correct: false }

])

badges = Badge.create!([
  { title: 'Test Badge', img: 'test_link', rule: 'test' }

])
# passed_tests = TestPassage.create!(user_id: users[0].id, test_id: tests[0].id,
#   created_at: '2020-12-14 05:43:25.762660', updated_at: '2020-12-14 05:43:25.762660')
