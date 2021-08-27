class NursesController < ApplicationController
  
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
