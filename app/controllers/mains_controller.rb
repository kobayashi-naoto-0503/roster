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
    @now = Date.current
    @next_month = @now.next_month
    @day = @next_month.end_of_month.day.to_i
    @one_day = @now.beginning_of_month.day
    @last_day = Date.new(Time.now.year, Time.now.month, -1).day
    @nurses = Nurse.all
    @term = Term.all
    #binding.pry
  end
  
end
