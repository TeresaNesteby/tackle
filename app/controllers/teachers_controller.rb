class TeachersController < ApplicationController
  before_action :authenticate_teacher!

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    respond_to do |format|
      if current_teacher.update(teacher_params)
        format.html { redirect_to action: "show", notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: current_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :password)
    end
end
