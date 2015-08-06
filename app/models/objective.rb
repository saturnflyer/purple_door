class Objective < ActiveRecord::Base
  belongs_to :worksheet

  validates :description, :worksheet_id, presence: true
end
