class Timecard < ApplicationRecord
  belongs_to :user

  # 今日のタイムカードを取得
  def today(user)
    date = Date.today
    condition = { user: user, year: date.year, month: date.month, day: date.day }
    self.find_by(condition) || self.new(condition)
  end

  # 指定年月のタイムカードを取得
  def monthly(user, year, month)
    self.where(user: user, year: year, month: month).order(:day).all
  end

  # タイムカードの日付を返す
  def date
    Date.new(year, month, day)
  end

  # 勤務時間を返す
  def work_hours_in_seconds
    if in_at && out_at
      out_at - in_at
    else
      0
    end
  end

  private
    def valid_date
      return if errors[:year].any? || errors[:month].any? || errors[:day].any?
      if !Date.valid_date?(year, month, day)
        errors[:base] << '不正な日付です'
      end
    end

    def out_at_is_later_than_in_at
      return if in_at.nil? || out_at.nil?

      if in_at > out_at
        errors[:base] << '退社時間は出社時間より後である必要があります'
      end
    end
end
