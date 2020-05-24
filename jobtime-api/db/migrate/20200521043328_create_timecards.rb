class CreateTimecards < ActiveRecord::Migration[6.0]
  def change
    create_table :timecards do |t|
      # 出勤時間
      t.datetime :in_at
      # 退勤時間
      t.datetime :out_at
      # 休憩時間
      t.integer :breaktime
      # 勤務時間
      t.float :working_hours
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
