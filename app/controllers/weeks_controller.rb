class WeeksController < ApplicationController
  
  def index
    @weeks = Week.all
  end
  def show
    @week = Week.find(params[:id])
    @course = @week.course
  end
  def create
    @course = Course.find(params[:course_id])
    @week = @course.weeks.new(week_params)
    if @week.save
      flash[:notice] = "Week saved successfully!"
      redirect_to course_path(@course)
    else
      flash[:alert] = "FAIL to save"
      render :new
    end
  end
  def new
    @course = Course.find(params[:course_id])
    @week = @course.weeks.new
  end
  def edit
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
  end
  def update
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
    if @week.update(week_params)
      flash[:notice] = "Update saved successfully!"
      redirect_to course_path(@course)
    else
      flash[:alert] = "FAIL to update"
      render :edit
    end
  end
  def destroy
    @course = @week.course
    @week.lessons.each { |lesson| lesson.destroy }
    if @week.destroy
      flash[:notice] = "Week Deleted"
      redirect_to course_path(@course)
    else
      flash[:alert] = "FAIL to delete"
    end
  end
  private
  def week_params
    params.require(:week).permit(:title, :course_id)
  end
end
