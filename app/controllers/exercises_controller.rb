class ExercisesController < ApplicationController
  def create
    Exercise.create!(exercise_params)
  end

  def new
    @exercise = Exercise.new
  end

  def index

  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :day)
  end
end