class LoginsController < ApplicationController
  before_action :forbid_login_user
  skip_before_action :user_logged_in?
  
  def index
  end
end
