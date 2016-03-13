class SessionsController < ApplicationController
  def new
  end

  def create
    @teacher = Teacher.authenticate(params[:teacher][:email], params[:teacher][:password])
    if @teacher.nil?
      flash.now[:error] = "Invalid email or password"
      redirect_to root_path
    else
      # sign_in(@teacher)
      redirect_to teacher_path(@teacher.id)
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

  private

    def teacher_params
      params.require(:teacher).permit(:password)
    end

end
