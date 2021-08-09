class MainsController < ApplicationController
  before_action :user_logged_in?
  
  def index
    @nurses = Nurse.all
    @nurse = Nurse.find_by(id: params[:id])
  end
end
