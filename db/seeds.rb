# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Curriculum.delete_all
Topic.delete_all


User.create(email: "user@example.com", password: "password")

curriculums = [
  {
    name: "Computer Skills",
    topics: [
      "Week 41 - Basic Computer Info",
      "Week 42 - Word Docs Part 1.ppt",
      "Week 42 - Word Docs Part 2.ppt"
    ]
  },
  {
    name: "Healthy Lifestyle",
    topics: [
      "Anger and Stress Management",
      "Healthy Relationships",
      "Mental Health"
    ]
  },
  {
    name: "Personal Planning",
    topics: [
      "Week 13 - Personal Planning"
    ]
  }
]


curriculums.each do |curriculum|
  current = Curriculum.create(name: curriculum[:name])
  curriculum[:topics].each do |topic|
    current.topics.create(name: topic)
  end
end
