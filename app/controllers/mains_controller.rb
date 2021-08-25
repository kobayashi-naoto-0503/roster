class MainsController < ApplicationController
  before_action :user_logged_in?
  
  def index
    #@now = Date.current
    #@next_month = @now.next_month
    #@day = @next_month.end_of_month.day.to_i
    #@one_day = @now.beginning_of_month.day
    #@last_day = Date.new(Time.now.year, Time.now.month, -1).day
    #@nurses = Nurse.all
    #@nurse = Nurse.find_by(id: params[:id])
  end
  
  def new
    @nurse_work_schdules = NurseWorkSchedule.new
    @nurse_holiday_schedules = NurseHolidaySchedule.new
    @now = Date.current #現在の日時
    @next_month = @now.next_month #現在から見て1ヶ月後の日時
    @day = @next_month.end_of_month.day.to_i #現在から見て1ヶ月後の日時の最終日を数値型で取得
    @one_day = @next_month.beginning_of_month.day #現在から見て1ヶ月後の日時の最初の日
    #@last_day = Date.new(Time.now.year, Time.now.month, -1).day 今月末日を取得している。
    @nurses = Nurse.all
    @terms = Term.all
    
    #binding.pry
  end
  
end
