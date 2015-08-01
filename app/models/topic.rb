class Topic < ActiveRecord::Base
  belongs_to :curriculum
  validates :name, presence: true
end
