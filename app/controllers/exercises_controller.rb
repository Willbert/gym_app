# comment
class ExercisesController < ApplicationController
  def create
    Exercise.create!(exercise_params.merge(user: current_user))
    redirect_to exercises_path
  end

  def new
    @exercise = Exercise.new
  end

  def index
    if params[:include] == 'all'
      @exercises = Exercise.where(user: current_user)
      @edit_button = true
      @show_less = true
    else
      @exercises = Exercise.for_today(current_user)
      @edit_button = false
      @show_less = false
      @show_all = true
    end
  end

  def edit
    @exercise = Exercise.find_by(id: params[:id], user: current_user)
  end

  def update
    Exercise.find_by(id: params[:id], user: current_user).update!(exercise_params)
    flash[:message] = 'Successfully updated'
    redirect_to exercises_path
  end

  def destroy
    Exercise.find_by(id: params[:id], user: current_user).destroy!
    flash[:message] = 'Successfully deleted'
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :day)
  end
end
