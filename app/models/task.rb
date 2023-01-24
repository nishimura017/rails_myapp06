class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_day, presence: true 
  validates :end_day, presence: true
  validates :memo,length: { maximum: 500 }

  validate :date_before_start
  validate :date_before_finish

  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は今日以降のものを選択してください。") if start_day < Date.today
  end

  def date_before_finish
    return if end_day.blank? || start_day.blank?
    errors.add(:end_day, "は開始日以降のものを選択してください。") if end_day < start_day
  end
	Task.count
end


