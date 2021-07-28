class NursesController < ApplicationController
  def new
    @nurse = Nurse.new
  end
  
  def create
    @nurse = Nurse.new(nurse_params)
    if @nurse.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def nurse_params
    params.require(:nurse).permit(:affiliation, :staff_id, :name, :authority, :password, :password_confirmation)
  end
end
