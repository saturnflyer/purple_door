class Objective < ActiveRecord::Base
  belongs_to :worksheet

  validates :description, :workshop_id, presence: true
end
