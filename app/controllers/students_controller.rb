class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html do
          redirect_to @student, notice: 'Student was successfully created.'
        end

        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }

        format.json do
          render json: @student.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html do
          redirect_to @student, notice: 'Student was successfully updated.'
        end

        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }

        format.json do
          render json: @student.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html do
        redirect_to students_url, notice: 'Student was successfully destroyed.'
      end

      format.json { head :no_content }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.fetch(:student, {})
  end
end
