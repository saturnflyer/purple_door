class UserWorksheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :worksheet
  has_many :question_answers
end
