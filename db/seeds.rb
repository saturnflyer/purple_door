# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  email:                  "user@example.com",
  password:               "password",
  password_confirmation:  "password",
  birthdate:              Date.today,
  first_name:             'Example',
  last_name:              'Last',
  superuser:              true
)

User.create!(
  email:                  "employee@example.com",
  password:               "password",
  password_confirmation:  "password",
  birthdate:              Date.today,
  first_name:             'Example',
  last_name:              'Last',
  superuser:              false
)

curriculum = Curriculum.create!(
  name: "The First"
)

topics = %w[Topic1 Topic2 Topic3].map { |t|
  Topic.create!(
    curriculum: curriculum,
    name: t
  )
}

worksheet = Worksheet.create(
  topic: Topic.first,
  title: 'COMMUNICATION & RELATIONSHIPS AT WORK',
  summary: "In order for the workplace to be enjoyable and productive, good
  working relationships must first be established.  Learning how to communicate
  well with the people with whom you work is key to building these healthy
  relationships.  In this class, a person will learn practical skills in working
  with the three groups of people that one can expect to encounter in the
  workplace: workmates, Supervisor/Boss, and customers.  A person will also
  learn healthy ways to deal with potentially “explosive” situations.  The theme
  underlying this class is a healthy respect for yourself and others.",
)

worksheet.objectives << Objective.create([
  { description: 'Gain an understanding of how to interact with people at work ' },
  { description: 'learn how to express yourself at work' }
])

worksheet.questions << Question.create([
  {description: 'What do you think it means to be respectful to other people?'},
  {description: 'When dealing with workmates, remember: '},
  {description: 'When dealing with Supervisor / Boss remember:'},
  {description: 'When dealing with customers remember:'}
])

Event.delete_all
dates = [
  '2015-08-03',
  '2015-08-04',
  '2015-08-05',
  '2015-08-06',
  '2015-09-11',
  '2015-10-20'
]

event_names = [
  "Dave's Sober Day",
  "1 year pingback",
  "Michael's Birthday",
  "Jane's Birthday",
  "Thom's Training Completion",
  "Mary's Graduation",
  "Jerry's Probation End Date"
]

dates.each do |date|
  num = rand(10) + 3
  num.times do
    Event.create(name: event_names[rand(3)], date: date)
  end
end
User.create!(email: "superuser@purpledoorcoffee.com",
            password: "password",
            superuser: true,
            first_name: 'Admin',
            last_name: 'Admin',
            birthdate: Time.now)

# Setup forums
User.where(superuser: true).each do |user|
  user.create_thredded_user_detail(superadmin: true)
end
