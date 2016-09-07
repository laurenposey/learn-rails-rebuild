class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
    @week = Week.find(params[:week_id])
    @lesson = @week.lessons.new
  end

  def edit
  end

  def create
    @week = Week.find(params[:week_id])
    @lesson = @week.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson saved successfully!"
      redirect_to week_path(@week)
    else
      flash[:alert] = "FAIL to save"
      render :new
    end
  end

  def update
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Update saved successfully"
      redirect_to week_path(@week)
    else
      flash[:alert] = "fail to update"
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @week = @lesson.week
    if @lesson.destroy
      flash[:notice] = 'Lesson was successfully destroyed.'
      redirect_to week_path(@week)
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
      @week = @lesson.week
    end

    def lesson_params
      params.require(:lesson).permit(:title, :content, :week_id)
    end
end
