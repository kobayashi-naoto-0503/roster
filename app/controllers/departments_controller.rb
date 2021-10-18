class DepartmentsController < ApplicationController
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def department_params
    params.require(:department).permit(:department)
  end
end
