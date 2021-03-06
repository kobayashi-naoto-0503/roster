class NursesController < ApplicationController
  
  def index
    @nurses = Nurse.all
    @terms =Term.all
    @hope_holidays = HopeHoliday.all
    @leaves = Leave.all
  end
  
  def new
    @nurse = Nurse.new
  end
  
  def show
    @nurse = Nurse.find_by(id: params[:id])
    #Nurse.find_by(id: params[:id])でNurseテーブルから、リンク元（ここではmainのindexview）からnurse_path(nurse.id)でリンクした名前のidを
    #取得し、このshowメソッドでそのidを使って検索している。
  end
  
  def create
    @nurse = Nurse.new(nurse_params)
    if @nurse.save
      redirect_to nurses_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def nurse_params
    params.require(:nurse).permit(:department_id, :staff_id, :name, :authority, :password, :password_confirmation)
  end
end
