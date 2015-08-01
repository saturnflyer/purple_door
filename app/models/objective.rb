class Objective < ActiveRecord::Base
  belongs_to :worksheet

  validates :description, presence: true
end
