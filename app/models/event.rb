class Event < ActiveRecord::Base
  validates :name, :date, :user_id, presence: true

  belongs_to :user
end
