class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
