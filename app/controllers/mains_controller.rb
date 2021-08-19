class MainsController < ApplicationController
  before_action :user_logged_in?
  
  def index
    @now = Date.current
    @day = @now.end_of_month.day.to_i
    @last_day = Date.new(Time.now.year, Time.now.month, -1).day
    @nurses = Nurse.all
    @nurse = Nurse.find_by(id: params[:id])
  end
end
