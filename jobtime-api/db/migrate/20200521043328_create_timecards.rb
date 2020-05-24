class CreateTimecards < ActiveRecord::Migration[6.0]
  def change
    create_table :timecards do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.datetime :in_at
      t.datetime :out_at
      t.integer :user_id

      t.timestamps
    end
  end
end
