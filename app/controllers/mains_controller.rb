class MainsController < ApplicationController
  before_action :user_logged_in?
  
  def index
    @nurses = Nurse.all
  end
end
