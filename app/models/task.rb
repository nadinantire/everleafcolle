class Task < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 2, maximum: 20}
  validate :start_datetime_cannot_be_later_than_end_datetime
  enum priority: [:low, :medium, :hight]
  private
  def start_datetime_cannot_be_later_than_end_datetime
    if start_date > end_date
      errors.add(:start_datetime, "Can not be set after the end date and time")
    end
  end
end
