class Question < ActiveRecord::Base
  belongs_to :worksheet
  has_many :question_answers, dependent: :destroy
  
  validates :description, presence: true
end
