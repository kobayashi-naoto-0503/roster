class LeavesController < ApplicationController
  def new
     @nurse = Nurse.find_by(id: params[:id])
     @leave = Leave.new
  end
  
  def create
    @leave = Leave.new(leave_params)
    if @leave.save
      redirect_to nurse_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def leave_params
    params.require(:leave).permit(:leave_type, :start_at, :end_at, :nurse_id)
  end
end
