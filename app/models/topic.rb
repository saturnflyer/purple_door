class Topic < ActiveRecord::Base
  belongs_to :curriculum
  has_many :worksheets, dependent: :destroy
  has_many :documents, dependent: :destroy
  validates :name, presence: true

  scope :top_level, ->{ where(ancestry: nil)}

  has_ancestry cache_depth: true
  
end
