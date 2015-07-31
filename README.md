# The Purple Door

This application supports the cirriculum used to help employees of [Purple Door Coffee](http://www.purpledoorcoffee.com)

> Purple Door Coffee is a specialty espresso bar and coffee shop in Denver, Colorado that employs teens and young adults who have been homeless and want to leave homelessness behind.

## Initial discussion notes

- Create a profile for each new employee. This would include all basic
info (name, birthday, hire date, maybe a photo)
- Have curriculum loaded on the software. When you go through the
curriculum for a specific individual it can mark the lesson 'done'.
- Have the ability to do the worksheets for curriculum electronically,
but still able to printed
- A place where the administrative team can add notes about the
discussion, points of concern, ideas, etc regarding that particular
lesson with that employee. When notes are added, a notification would
be sent to other admins that can then read them.
- An abitlity to look at the overview of an employees place in the
curriculum program. How many lessons have they completed? How many are
incomplete and how many still need to be done? A way to track their
jobs and keep notes on meetings with them after they leave Purple
DoorCoffee.
- Reminders about employees birthdays, sober dates, and other important dates.
- A calendar with reminders for reviews and other marks where
employees need to have meetings on specific dates.
- A way to track data about who has come in to the program, who has
completed to program and is a graduate, who was let go, who is still
holding a job after graduation...etc.

## Later discussion notes

- Powerpoint slides are curriculum
  - wants to upload and click through them on the site
  - divided by sections and topics
  - apply cirriculum to a profile (check off that items were done, admin confirms completion, admin writes notes, other admins notified)
    - person can read notes
    - person cannot see admin messages/conversation
    - saving notes helps with grant applications
- word docs are worksheets
  - able to print
- Only 3 employees are around at a time
  - stay for a year
  - cycle through and about 6 will be around in a given year
  - program is growing but will take a while to get to 10 in a given year
- wants export the data and/or search for information
- connect calendar to google calendars
- prompt admin to write notes right away after cirriculum meeting

## Dev environment setup

* Ruby 2.2.2
* Rails 4.2
* [Postgres](http://www.postgresql.org/) 9.4
* Clone the repo: `git clone git@github.com:saturnflyer/purple_door.git`
* `bundle install`
* `bundle exec rake db:setup`
* `bundle exec rake` to run the test suite

## Using rails server

* `bundle exec rails server`
* Browse to [http://localhost:3000](http://localhost:3000) to confirm everything works.

## Using Pow

* Check out [pow.cx](http://pow.cx) and follow those instructions

## Team Communications

* Slack Channel - [https://rubyforgood.slack.com/messages/purple/](https://rubyforgood.slack.com/messages/purple/)
* Github Issues - [https://github.com/saturnflyer/purple_door/issues](https://github.com/saturnflyer/purple_door/issues)
* Waffle.io - [https://waffle.io/saturnflyer/purple_door](https://waffle.io/saturnflyer/purple_door)

 

