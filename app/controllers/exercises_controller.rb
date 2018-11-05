class ExercisesController < ApplicationController
  def create
    Exercise.create!(exercise_params)
  end

  def new
    @exercise = Exercise.new
  end

  def index
    if params[:include] == 'all'
      @exercises = Exercise.all
      @edit_button = true
    else
      @exercises = Exercise.for_today
      @edit_button = false
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    Exercise.find(params[:id]).update!(exercise_params)
    flash[:message] = 'Successfully updated'
    redirect_to exercises_path
  end

  def destroy
    Exercise.find(params[:id]).destroy!
    flash[:message] = 'Successfully deleted'
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :day)
  end
end