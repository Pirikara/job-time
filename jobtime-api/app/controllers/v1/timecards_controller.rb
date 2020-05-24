class V1::TimecardsController < ApplicationController
  def create
    @timecard = Timecard.new(timecard_params)

    if @timecard.save
      render json: @timecard, status: :created
    else
      render json: @timecard.errors, status: :unprocessable_entity
    end
  end

  def show
    timecard = Timecards.all
  end

  private
    def timecard_params
      params.require(:timecard).permit(:year, :month, :day, :in_at, :user_id)
    end

    def timecard_update_params
      params.require(:timecard).permit(:year, :month, :day, :out_at, :user_id)
    end

    def monthly_time_cards(user, year, month)
      number_of_days_in_month = Date.new(year, month, 1).next_month.prev_day.day
      results = Array.new(number_of_days_in_month) # 月の日数分nilで埋めた配列を用意
      timecards = Timecard.monthly(user, year, month)
      timecards.each do |card|
        results[card.day - 1] = card
      end
      results
    end
end