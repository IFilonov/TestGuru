# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Response.all.count == 0
  Answer.all.delete_all
  Question.all.delete_all
  Test.all.delete_all
  Category.all.delete_all

  categories = Category.create([{ title: 'Languages' }, { title: 'Frameworks' }])

  if User.all.count > 0
    users = User.all
  else
    users = User.create([
      { email: 'author@author', password: 'author', type: 'User', first_name: 'first_name', last_name: 'last_name' }
      ])
  end

  tests = Test.create([
    { title: 'Ruby', category_id: categories.first.id, author_id: users.first.id },
    { title: 'Rails', category_id: categories.last.id, author_id: users.first.id }
    ])

  questions = Question.create([
    { body: 'Какое значение получит переменная x в выражении x ||= 1', test_id: tests[0].id },
    { body: 'Укажите оператор который не поддерживается Ruby', test_id: tests[0].id },
    { body: 'С какого символа начинаются глобальные переменные?', test_id: tests[0].id },
    { body: 'Какой из перечисленных методов не позволит создать массив?', test_id: tests[0].id },
    { body: 'Какая директория является стандартной в Rails?', test_id: tests[1].id },
    { body: 'Какой файл используется для задания начальных значений модели данных', test_id: tests[1].id },
    { body: 'Какой глагол не входит в архитектуру REST', test_id: tests[1].id }
    ])

  Answer.create([
    { body: 'nil',  question_id: questions[0].id },
    { body: '0',    question_id: questions[0].id },
    { body: '1',    question_id: questions[0].id, correct: true },
    { body: 'true', question_id: questions[0].id },

    { body: '==',   question_id: questions[1].id },
    { body: '!==',  question_id: questions[1].id, correct: true },
    { body: '!=',   question_id: questions[1].id },
    { body: '===',  question_id: questions[1].id },
    { body: '<=>',  question_id: questions[1].id },

    { body: '@@', question_id: questions[2].id },
    { body: '@',  question_id: questions[2].id },
    { body: '#',  question_id: questions[2].id },
    { body: '$',  question_id: questions[2].id, correct: true },

    { body: 'Array.new(10,0)',  question_id: questions[3].id },
    { body: '[*0..10]',         question_id: questions[3].id },
    { body: 'Array.new(10)',    question_id: questions[3].id },
    { body: '%w[1, 2, 3]',      question_id: questions[3].id },
    { body: 'Array.new(0..10)', question_id: questions[3].id, correct: true },

    { body: 'db',           question_id: questions[4].id },
    { body: 'lib',          question_id: questions[4].id },
    { body: 'config',       question_id: questions[4].id },
    { body: 'являются все', question_id: questions[4].id, correct: true },

    { body: 'config.db',  question_id: questions[5].id },
    { body: 'seeds.rb',   question_id: questions[5].id },
    { body: 'schema.db',  question_id: questions[5].id },
    { body: 'default.rb', question_id: questions[5].id, correct: true },

    { body: 'PUT',    question_id: questions[6].id },
    { body: 'GET',    question_id: questions[6].id },
    { body: 'UPDATE', question_id: questions[6].id, correct: true },
    { body: 'DELETE', question_id: questions[6].id },
    { body: 'POST',   question_id: questions[6].id }
    ])
end
Badge.create([
  { name: 'Badge by Category', file_name: 'badge.jpg' },
  { name: 'Badge by Rule', file_name: 'badge.jpg' },
  { name: 'Badge by Attempt', file_name: 'badge.jpg' }
  ])
Rule.create([
  { name: 'Category', value: 'Languages' },
  { name: 'Level', value: '0' },
  { name: 'Attempt', value: '1' }
  ])
