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
  { username: 'Test_user', password: '124', level: 0 },
  { username: 'Test_user2', password: '124', level: 2 }
])

tests = Test.create!([
  { title: 'Sample test one', level: 1, category_id: categories[0].id, user_id: users[0].id },
  { title: 'Sample test two', level: 2, category_id: categories[1].id, user_id: users[0].id }
])

questions = Question.create!([
  { title: 'Какой вы изучаете язык программирования?', test_id: tests[0].id },
  { title: 'Какой сегодня год?', test_id: tests[0].id }
])

answers = Answer.create!([
  { body: 'Ruby', question_id: questions[0].id, correct: true },
  { body: 'Ruby2', question_id: questions[0].id, correct: false }
])

passed_tests = PassedTest.create!(user_id: users[0].id, test_id: tests[0].id, 
  created_at: '2020-12-14 05:43:25.762660', updated_at: '2020-12-14 05:43:25.762660')

