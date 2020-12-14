# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: 'ruby')
Category.create(title: 'web')

Test.create(title: 'One', level: 0, category_id: 1)
Test.create(title: 'Two', level: 0, category_id: 2)
Test.create(title: 'Three', level: 1, category_id: 1)

Question.create(title: 'Какой вы изучаете язык программирования?', test_id: 1)

Answer.create(body: 'Ruby', question_id: 1, correct: true)
Answer.create(body: 'Pascal', question_id: 1, correct: false)

User.create(username: 'Test_user', password: '123', level: 0)

PassedTest.create(user_id: 1, test_id: 1, created_at: '2020-12-14 05:43:25.762660', updated_at: '2020-12-14 05:43:25.762660')
