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
  superuser:              true
)

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
