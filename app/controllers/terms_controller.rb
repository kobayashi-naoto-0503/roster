class TermsController < ApplicationController
  
  def index
    @nurses = Nurse.all
  end
  
  def show
    @nurse = Nurse.find_by(id: params[:id])
    @term = Term.find_by(nurse_id: params[:id])
  end
  
  def edit
    #binding.pry
    #@nurse = Nurse.find_by(id: params[:id])
    @term = Term.find(params[:id])
    @nurse = @term.nurse
  end
  
  def update
    @term = Term.find(params[:id])
     @nurse = @term.nurse
    @term.update(term_update_params) 
    redirect_to term_path(@nurse.id), success: '更新が完了しました'
    #pathでviewに送るidをコントローラーで取得し、渡す。
  end
  
  def new
    @nurse = Nurse.find_by(id: params[:format])
    @term = Term.new
  end
  
  def create
    @nurse = Nurse.find_by(id: params[:format])
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
  
  def term_update_params
    params.require(:term).permit(:employment, :day_shift, :night_shift, :after_night_shift)
  end
end
