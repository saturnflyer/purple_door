class Topic < ActiveRecord::Base
  belongs_to :curriculum
  has_many :worksheets, dependent: :destroy
  validates :name, presence: true
end
