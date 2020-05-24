class V1::TimecardsController < ApplicationController
  def jobin
    @timecard = Timecard.new(timecard_params)
    @user = User.find(@timecard.user_id)
    if Timecard.first_jobin_push?(@user.id)
      @timecard = Timecard.new(timecard_params)
      @timecard.in_at = Time.now
      @timecard.save
    else
      render status: 409, json: { status: 409, message: "既に出勤済みです"}
    end
  end

  def jobout
    @timecard = Timecard.new(timecard_params)
    @user = User.find(@timecard.user_id)

    if Timecard.jobin_pushed?(@user.id)
      @timecard = Timecard.where(user_id: @user.id).where(in_at: Time.now.midnight..(Time.now.midnight + 1.day))
      @working_hours = Time.now - @timecard.in_at
      if @working_hours >= 28800
        @breaktime = 60
      elsif @working_hours >= 25200
        @breaktime = 45
      else
        @breaktime = 30
      end

      @timecard.update(out_at: Time.now, breaktime: @breaktime, working_hours: @working_hours )
    else
      render status: 409, json: { status: 409, message: "まだ出勤していません" }
    end
  end

  def schedule
    user = User.find(params[:id])
    # 今月のtimecardを抽出
    timecards = Timecard.where(user_id: user.id).where(in_at: Time.now.all_month)
    render json: timecards
  end

  private
    def timecard_params
      params.require(:timecard).permit(:user_id)
    end
end