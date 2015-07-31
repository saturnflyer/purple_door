class QuestionAnswer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user_worksheet
end
