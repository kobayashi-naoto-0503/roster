class TermsController < ApplicationController
  
  def index
    @nurses = Nurse.all
  end
  
  def show
    @term = Term.find_by(id: params[:id])
  end
  
  
  def new
    @nurse = Nurse.find_by(id: params[:id])
    @term = Term.new
  end
  
  def create
    @nurse = Nurse.find_by(id: params[:id])
    @term = Term.new(term_params)
    if @term.save
      redirect_to nurse_path(@nurse.id), success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def term_params
    params.require(:term).permit(:employment, :day_shift, :night_shift, :after_night_shift, :nurse_id)
  end
end
