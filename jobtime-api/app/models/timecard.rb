class Timecard < ApplicationRecord
  belongs_to :user

  def self.first_jobin_push?(id)
    if Timecard.where(user_id: id).where(in_at: Time.now.midnight..(Time.now.midnight + 1.day)).empty?
      # 押してない
      return true
    else
      # 押してる
      return false
    end
  end

  def self.jobin_pushed?(id)
    # ユーザーが今日出勤ボタンを押しているか？
    if Timecard.where(user_id: id).where(in_at: Time.now.midnight..(Time.now.midnight + 1.day)).empty?
      # 押してない
      return false
    else
      # 押してる
      return true
    end
  end
end