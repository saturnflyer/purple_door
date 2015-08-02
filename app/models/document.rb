class Document < ActiveRecord::Base
  belongs_to :topic

  validates :title, :url, :topic_id, presence: true
end
