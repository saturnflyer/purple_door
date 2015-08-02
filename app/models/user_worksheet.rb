class UserWorksheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :worksheet
  has_many :question_answers

  accepts_nested_attributes_for :question_answers, reject_if: proc { |attr| attr[:description].blank? }

  def status
    if worksheet.questions.count == question_answers.count
      'complete' 
    else
      'incomplete'
    end
  end

end
