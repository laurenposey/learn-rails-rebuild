class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end
  def show
    @weeks = @course.weeks
  end
  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course saved successfully!"
      redirect_to courses_path
    else
      flash[:alert] = "FAIL to save"
      render :new
    end
  end
  def new
    @course = Course.new
  end
  def edit
  end
  def update
    if @course.update(course_params)
      flash[:notice] = "Update saved successfully!"
      redirect_to courses_path
    else
      flash[:alert] = "FAIL to update"
      render :edit
    end
  end

  def destroy
    @course.weeks.each { |week| week.destroy }
    if @course.destroy
      flash[:notice] = "Course Deleted"
      redirect_to courses_path
    else
      flash[:alert] = "FAIL to delete"
    end
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end
  def course_params
    params.require(:course).permit(:title, :teacher)
  end
end
