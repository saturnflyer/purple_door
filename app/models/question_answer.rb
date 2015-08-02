class QuestionAnswer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user_worksheet

  validates :question_id, :user_worksheet_id, presence: true
end
