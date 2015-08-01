class Worksheet < ActiveRecord::Base
  has_many :user_worksheets, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :objectives, dependent: :destroy
  belongs_to :topic

  accepts_nested_attributes_for :questions, :objectives,
    reject_if: proc { |attr| attr[:description].blank? }
  
  validates :title, :summary, presence: true
end
